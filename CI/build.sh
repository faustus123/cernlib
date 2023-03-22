#!/bin/bash

export TOP=$(pwd)
set -x
BUILDSYSTEM=$1
#[imake = Imake  cmake = CMake]
TARGET=$2
#[tarball, rpm = build RPMs, tarball32bit = pass -m32 to tarball]
TOOLCHAIN=$3 
#[GNU,INTEL,NVIDIA,CLANG]
BEAROPTION=$4
#[anything, bear = use bear, bear3 = use bear version 3 ]

if [ x"$TARGET" != x"rpm" ] && [ x"$TARGET" != x"brew" ]; then
echo $TMP
unset TMP
mkdir -p /tmp
CHUARCH=64bit
if [ x"$TARGET" == x"tarball32bit" ]; then
CHUARCH=32bit
fi
if  [ x"$BUILDSYSTEM" == x"imake" ]; then
  export CERN=$(pwd)/tmp/cern 
  if [ x"$BEAROPTION" == x"bear3" ]; then
    bear --output imakeGNU.json -- sh make_cernlib $CHUARCH $TOOLCHAIN
    exit $?
  fi
  if [ x"$BEAROPTION" == x"bear" ]; then
    bear --cdb imakeGNU.json sh make_cernlib $CHUARCH $TOOLCHAIN
    exit $?
  fi
  sh make_cernlib $CHUARCH $TOOLCHAIN
  exit $?
fi
fi

cd $TOP
unset TMP
CL_VERSION=2022.11

mkdir -p TEMP/${CL_VERSION}/src

cat CMakeLists.txt |sed 's/__CL_VERSION__/'${CL_VERSION}'/g' >   TEMP/${CL_VERSION}/src/CMakeLists.txt
cp -r cmake      TEMP/${CL_VERSION}/src
cp -r lapack      TEMP/${CL_VERSION}/src
cp -r cfortran   TEMP/${CL_VERSION}/src
cp -r geant321   TEMP/${CL_VERSION}/src
cp -r phtools    TEMP/${CL_VERSION}/src
cp -r scripts    TEMP/${CL_VERSION}/src
cp -r config     TEMP/${CL_VERSION}/src
cp -r mclibs     TEMP/${CL_VERSION}/src
cp -r packlib    TEMP/${CL_VERSION}/src
cp -r kernlib    TEMP/${CL_VERSION}/src
cp -r pawlib     TEMP/${CL_VERSION}/src
cp -r mathlib    TEMP/${CL_VERSION}/src
cp -r graflib    TEMP/${CL_VERSION}/src
cp -r paw_motif  TEMP/${CL_VERSION}/src
cp -r code_motif TEMP/${CL_VERSION}/src
cp -r contrib    TEMP/${CL_VERSION}/src
cp  Imakefile    TEMP/${CL_VERSION}/src
cp -r include    TEMP/${CL_VERSION}/src
cp -r patchy5    TEMP/${CL_VERSION}/src
cp -r patchy4    TEMP/${CL_VERSION}/src

if [ x"$TARGET" != x"rpm" ] && [ x"$TARGET" != x"brew" ]; then
if [ x"$BUILDSYSTEM" == x"cmake" ]; then
  cat CMakeLists.txt |sed 's/__CL_VERSION__/'${CL_VERSION}'/g' >   TEMP/$CL_VERSION/src/CMakeLists.txt
  cd TEMP/${CL_VERSION}/src
  export PYTHON=python
  if [ -f /usr/bin/python3 ]; then
    export PYTHON=python3
  fi
  #$PYTHON $TOP/CI/imake2cmake.py
  extra_args=" "
  if [[ $TOOLCHAIN == *CLANG ]]; then
   export TOOLCHAIN=CLANG
   export CC=clang
   export CXX=clang++
   export FC=gfortran
  fi
  if [[ $TOOLCHAIN == GNU ]]; then
   export TOOLCHAIN=GNU
   export CC=gcc
   export FC=gfortran
  fi
  if [[ $TOOLCHAIN == GNU-* ]]; then
   N=$(echo $TOOLCHAIN | cut -f 2 -d\-)
   export TOOLCHAIN=GNU-$N
   export CC=gcc-$N
   export FC=gfortran-$N
  fi
  if [[ $TOOLCHAIN == GNU3 ]]; then
   export TOOLCHAIN=GNU3
   export CC=gcc
   export FC=g77
   extra_args=$extra_args" -DCERNLIB_USE_INTERNAL_XBAE=ON "
  fi
  if [[ $TOOLCHAIN == GNU4 ]]; then
   export TOOLCHAIN=GNU4
   export CC=gcc4
   export FC=gfortran
   extra_args=$extra_args" -DCERNLIB_USE_INTERNAL_LAPACK=ON -DCERNLIB_USE_INTERNAL_XBAE=ON "
  fi

  if [[ $TOOLCHAIN == *NVIDIA ]]; then
   set +x
   nvidiaversion=$(ls -1r /opt/nvidia/hpc_sdk/modulefiles/nvhpc/ | grep 2 | head -n 1)
   module  load /opt/nvidia/hpc_sdk/modulefiles/nvhpc/$nvidiaversion
   set -x
   export TOOLCHAIN=NVIDIA
   export CC=nvc
   export FC=nvfortran
  fi
  if [[ $TOOLCHAIN == *INTEL ]]; then
   set +x
   intelversion=$(ls -1r /opt/intel/oneapi/compiler/ | grep 20 | head -n 1)
   source /opt/intel/oneapi/compiler/$intelversion/env/vars.sh
   set -x
   export TOOLCHAIN=INTEL
   export CC=icc
   export FC=ifort
  fi
  export CMAKE=cmake
  if [ -f /usr/bin/cmake3 ]; then
    export CMAKE=cmake3
  fi
  CMAKE_VERSION=$($CMAKE --version | head -n 1  | grep -oh "[0123456789\.].*" | sed 's/\./\*10000\+/1' | sed 's/\./\*100\+/1' | sed 's/\./\*1\+/1' | sed 's/\./\*0\+/1' | bc -l )
  SED=sed
  if [ "$(uname)" == "Darwin" ]; then
    openmotifversion=$(ls -1r /usr/local/Cellar/openmotif/ | head -n 1)
    extra_args=$extra_args"-DMOTIF_INCLUDE_DIR=/usr/local/Cellar/openmotif/"$openmotifversion"/include/ -DMOTIF_LIBRARIES=/usr/local/Cellar/openmotif/"$openmotifversion"/lib/libXm.dylib "
    SED=gsed
  fi
  if [ "$(uname)" == "SunOS" ]; then
    SED=gsed
    extra_args=$extra_args"-DCERNLIB_USE_INTERNAL_XBAE=ON -DCERNLIB_USE_INTERNAL_LAPACK=ON"
  fi
  if [ "$(uname)" == "Linux" ]; then
    extra_args=$extra_args"-DCERNLIB_USE_INTERNAL_XBAE=OFF -DCERNLIB_USE_INTERNAL_LAPACK=OFF"
  fi
     BEAR=""
  if [ x"$BEAROPTION" == x"bear" ]; then
    BEAR="bear --cdb "$TOP"/cmake"$TOOLCHAIN".json "
  fi
  if [ x"$BEAROPTION" == x"bear3" ]; then
    BEAR="bear --output "$TOP"/cmake"$TOOLCHAIN".json --"
  fi
  if [ x"$TARGET" == x"tarball32bit" ]; then
    extra_args=$extra_args" -DCERNLIB_FORCE_32=ON "
  fi

  if (( CMAKE_VERSION < 31500)); then
    find ./ -name CMakeLists.txt -exec $SED -i -e 's@list(TRANSFORM@list_TRANSFORM(@g' -e 's@list(JOIN@list_JOIN(@g' {} \;        
  fi
  mkdir -p BUILD$TOOLCHAIN
  cd BUILD$TOOLCHAIN
  if [ x"$TARGET" != x"rpm" ] && [ x"$TARGET" != x"brew" ]; then
    $CMAKE   ../  ${extra_args} -DCMAKE_C_COMPILER=${CC} -DCERNLIB_BUILD_SHARED=OFF -DCMAKE_Fortran_COMPILER=${FC} -DCERNLIB_ENABLE_TEST=ON -DCMAKE_INSTALL_PREFIX=/2022.11
    $BEAR make -j 20 || exit $?
    ctest . --force-new-ctest-process --output-on-failure --timeout 60 -E 'testgexam2|testgexam4' || ctest . --force-new-ctest-process --output-on-failure --rerun-failed --timeout 60 -j 1 || ctest . --force-new-ctest-process --output-on-failure --rerun-failed --timeout 60 -j 1 -E 'testzebfz2|testkernnumtest|testgent|testerexam1|testerexam2|testzexam|testgexam2|testgexam4'  -j 1
    mkdir -p $TOP/cern
    $CMAKE --install .
    make DESTDIR=$TOP/cern install
    exit $?
  else
    $CMAKE   ../  ${extra_args} -DCMAKE_C_COMPILER=${CC} -DCERNLIB_BUILD_SHARED=OFF -DCMAKE_Fortran_COMPILER=${FC} -DCERNLIB_ENABLE_TEST=ON  -DCMAKE_INSTALL_PREFIX=$TOP/INSTALLCMAKE -DCMAKE_INSTALL_LIBDIR=$TOP/INSTALLCMAKE$TOOLCHAIN/lib64/cernlib/$CL_VERSION/lib -DCMAKE_INSTALL_INCLUDEDIR=$TOP/INSTALLCMAKE$TOOLCHAIN/include/cernlib/$CL_VERSION
    $BEAR make -j 20 || exit $?
    $CMAKE --install . || exit $?
    ctest . --force-new-ctest-process --output-on-failure --timeout 60 -E 'testgexam2|testgexam4' || ctest . --force-new-ctest-process --output-on-failure --rerun-failed --timeout 60 -j 1 || ctest . --force-new-ctest-process --output-on-failure --rerun-failed --timeout 60 -j 1 -E 'testzebfz2|testkernnumtest|testgent|testerexam1|testerexam2|testzexam|testgexam2|testgexam4'  -j 1
    exit $?
  fi
fi
fi

if [ x"$TARGET" == x"brew" ] &&  [ "$(uname)" == "Darwin" ]; then
  cd $TOP/TEMP
  gsed -i 's/CMAKE_VERBOSE_MAKEFILE\ ON/CMAKE_VERBOSE_MAKEFILE\ OFF/g' ${CL_VERSION}/src/CMakeLists.txt
  rm -rf ${CL_VERSION}/CI/cernlib.rb
  tar -zcf   --sort=name --no-acls  --no-xattrs   ${CL_VERSION}_src.tar.gz ${CL_VERSION}
  SHA256SUM=$(sha256sum ${CL_VERSION}_src.tar.gz | cut -f 1 -d' ')
  cd $TOP
  mkdir -p /tmp
  export HOME=$TOP
  cd $TOP/TEMP
  mkdir -p Formula
  cp $TOP/CI/cernlib.rb Formula
  gsed -i   '5i\ \ url \"file://'$TOP'/TEMP/'${CL_VERSION}'_src.tar.gz\"' Formula/cernlib.rb
  gsed -i   '6i\ \ sha256\ \"'$SHA256SUM'\"' Formula/cernlib.rb
  brew install --build-bottle Formula/cernlib.rb
  exit $?
fi


if [ x"$TARGET" == x"rpm" ] &&  [ "$(uname)" == "Linux" ]; then
  cd $TOP/TEMP
  tar -zcf  ${CL_VERSION}_src.tar.gz ${CL_VERSION}
  cd $TOP
  mkdir -p /tmp
  export HOME=$TOP
  if [ x"$BUILDSYSTEM" == x"cmake" ]; then
    mkdir -p $TOP/rpmbuildcmake/{SOURCES,SPECS,RPMS,SRPMS,BUILD} 
    mv TEMP/${CL_VERSION}_src.tar.gz   rpmbuildcmake/SOURCES
    cat CI/cernlib.spec.cmake | sed 's/__CL_VERSION__/'${CL_VERSION}'/g' >  $TOP/cernlib.spec.cmake
    RHL=$(cat /etc/redhat-release | grep -ohw '[0123456789.]*' | cut -f 1 -d.)
    if [ x"$RHL" != x"" ]; then
    if (( RHL < 6 )); then
      echo '%rhel '$RHL > $TOP/.rpmmacros 
    fi
    fi
    echo '%_topdir '$TOP'/rpmbuildcmake' >> $TOP/.rpmmacros
    if [ x"$BEAROPTION" == x"bear" ]; then
      rpmbuild -bs        $TOP/CI/cernlib.spec.cmake.debug
      rpmbuild --rebuild  $TOP/rpmbuildcmake/SRPMS/cernlib-*${CL_VERSION}-*  
    else
      mkdir -p $TOP/rpmbuildcmake/BUILD
      rpmbuild -bs        $TOP/cernlib.spec.cmake
      rpmbuild --rebuild  $TOP/rpmbuildcmake/SRPMS/cernlib-*${CL_VERSION}-*  
    fi
    exit $?
  fi
  if [ x"$BUILDSYSTEM" == x"imake" ]; then
    mkdir -p $TOP/rpmbuild/{SOURCES,SPECS,RPMS,SRPMS,BUILD}
    RHL=$(cat /etc/redhat-release | grep -ohw '[0123456789.]*' | cut -f 1 -d.)
    if [ x"$RHL" != x"" ]; then
    if (( RHL < 6 )); then
      echo '%rhel '$RHL > $TOP/.rpmmacros 
    fi
    fi
    echo '%_topdir '$TOP'/rpmbuild' >> $TOP/.rpmmacros 
    mv TEMP/${CL_VERSION}_src.tar.gz   rpmbuild/SOURCES
    if [ x"$BEAROPTION" == x"bear" ]; then
      rpmbuild -bs       $TOP/CI/cernlib.spec.debug
      rpmbuild --rebuild $TOP/rpmbuild/SRPMS/cernlib-${CL_VERSION}-*  
    else
      rpmbuild -bs       $TOP/CI/cernlib.spec
      rpmbuild --rebuild $TOP/rpmbuild/SRPMS/cernlib-${CL_VERSION}-*  
    fi
    exit $?
  fi
fi
echo "You set wrong combination of arguments for this system"
exit 1

