%if %{?rhel}%{!?rhel:0} >= 8 || %{?fedora}%{!?fedora:0}
%global optflags  -DL_cuserid=512
%endif

%if %{?fedora}%{!?fedora:0} 
#global optflags -std=legacy -DL_cuserid=512 -fallow-argument-mismatch -fallow-invalid-boz -fcommon
#For Fedora it makes sense to check the compiler version
# replace gcc optimization flags
# for gcc < 8 must be -O (no -O2 or -O3)
#
# gcc -dumpversion => older 4.8.5 => newer 8
%define gcc_dump_ver %(gcc -dumpversion | sed 's/[.].*$//')

%if 0%{?gcc_dump_ver} < 8
%global optflags %(echo %{optflags} | sed 's/-O[0-3]/-O/')
%endif

# 2020-05-23
%if 0%{?gcc_dump_ver} >= 10
%global optflags %(echo %{optflags} -fcommon )
%endif
%endif

#DBG
%if %{?fedora}%{!?fedora:0}
%global optflags %(echo %{optflags} | sed 's/-Werror=format-security//')
%endif
%global optflags %(echo %{optflags}   ) -I%(gcc --print-file-name=include)


%if 0%{?fedora}
%if 0%{?fedora} > 6
%bcond_without gfortran
%else
%bcond_with gfortran
# this is set to 1 if g77 is used for the cernlib package without
# suffix.
%define g77_cernlib_compiler 1
%endif

%if 0%{?fedora} <= 3
%define old_lapack_name 1
%endif
%if 0%{?fedora} <= 4
%define monolithic_X 1
%endif
%endif

%if 0%{?rhel}
%bcond_without gfortran
%endif

%if 0%{?suse_version}
%bcond_without gfortran
%endif

# compiler is used to disambiguate package names and executables
%if %{with gfortran}

%define compiler_string -gfortran
%if 0%{?g77_cernlib_compiler}
%define compiler -gfortran
%endif

%else
# g77 is used to build the utilities that goes in the packages without
# suffix.
%define utils_compiler 1
%define compiler_string -g77
%if ! 0%{?g77_cernlib_compiler}
%define compiler -g77

# there is no --build-id in RHEL 5.
%if 0%{?rhel}
%if 0%{?rhel} <= 5
%define no_build_id 1
%endif
%endif

%endif
# no compat prefix, the utilities compiled with gfortran are non functionnal
# see Bug 241416
#%%define compat compat-
%endif
# verdir is the directory used for libraries and replaces the version 
# in some files and file names
%define verdir %{version}%{?compiler}
# data files should be the same and therefore parallel installable

Name:          %{?compat}cernlib%{?compiler}
Version:       2022.11
Release:       1%{?dist}
Summary:       General purpose CERN library
Group:         Development/Libraries
License:       GPL+ and LGPLv2+
URL:           http://cernlib.web.cern.ch/cernlib/

# fedora core

%if 0%{?old_lapack_name}
BuildRequires: lapack blas
%else
BuildRequires: lapack-devel blas-devel
%endif

%if 0%{?suse_version}
BuildRequires: lapacke-devel
%endif

%if 0%{?monolithic_X}
BuildRequires: xorg-x11-devel 
%else
BuildRequires: imake libXaw-devel
# workaround #173530
BuildRequires: libXau-devel
%endif

# indirectly requires lesstif or openmotif and X libs
BuildRequires: xbae-devel

# for patchy build scripts
BuildRequires: tcsh
BuildRequires: gawk

BuildRequires: desktop-file-utils

%if %{?fedora}%{!?fedora:0} >=28 || %{?rhel}%{!?rhel:0} >= 8
BuildRequires: libnsl libnsl2-devel make
%endif

%if %{with gfortran}
%if 0%{?rhel} || 0%{?fedora}
BuildRequires: gcc-gfortran
%endif
%if 0%{?suse_version}
BuildRequires:  gcc-fortran
%endif
%else
BuildRequires: /usr/bin/g77
%endif
BuildRoot:     %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Source0:    2022.11_src.tar.gz


%description
CERN program library is a large collection of general purpose libraries
and modules maintained and offered on the CERN. Most of these programs 
were developed at CERN and are therefore oriented towards the needs of a 
physics research laboratory that is general mathematics, data analysis, 
detectors simulation, data-handling etc... applicable to a wide range 
of problems.

The main and devel packages are parallel installable, but not the helper
scripts from the utils subpackage.

%package devel
Summary:       General purpose CERN library development package

%if 0%{?old_lapack_name}
Requires:       lapack blas
%else
Requires:       lapack-devel blas-devel
%endif

%if 0%{?fedora} >= 28 || %{?rhel}%{!?rhel:0} >= 8
Requires: libnsl2-devel
%endif
%if 0%{?suse_version}
BuildRequires: libnsl-devel
%endif
# Motif and X devel libs are indirectly required through xbae
Requires: xbae-devel

%if 0%{?monolithic_X}
Requires:      xorg-x11-devel
%else
# workaround #173530
Requires:      libXau-devel
Requires:      libXaw-devel
%endif
Requires:      %{name} = %{version}-%{release}
Group:         Development/Libraries
Provides:  cernlib(devel) = %{version}-%{release}

# for the m4 macro directory ownership
Requires: automake

%description devel
CERN program library is a large collection of general purpose libraries
and modules maintained and offered on the CERN. Most of these programs 
were developed at CERN and are therefore oriented towards the needs of a 
physics research laboratory that is general mathematics, data analysis, 
detectors simulation, data-handling etc... applicable to a wide range 
of problems.

The cernlib-devel package contains the header files and symlinks needed  
to develop programs that use the CERN library using dynamic libraries.

Static libraries are in %{name}-static.

%package static
Summary:       General purpose CERN library static libraries
Group:         Development/Libraries
Requires:  %{name}-devel = %{version}-%{release}
Provides:  cernlib(static) = %{version}-%{release}

%description static
CERN program library is a large collection of general purpose libraries
and modules maintained and offered on the CERN. Most of these programs 
were developed at CERN and are therefore oriented towards the needs of a 
physics research laboratory that is general mathematics, data analysis, 
detectors simulation, data-handling etc... applicable to a wide range 
of problems.

The %{name}-static package contains the static cernlib libraries.

%package utils
Summary:   CERN library compilation and environment setting scripts
Group:     Applications/System
Requires:  %{name}-devel = %{version}-%{release}
Requires:  %{name}-static = %{version}-%{release}
Provides:  cernlib(utils) = %{version}-%{release}

%description utils
CERN library compilation and environment setting scripts.

This package will conflict with other versions, therefore if you 
want to have different compile script and different environments for 
different versions of the library you have to set them by hand.

%package -n %{?compat}geant321%{?compiler}
Summary:  Particle detector description and simulation tool
Group:    Applications/Engineering
Requires: %{name}-devel = %{version}-%{release}
Requires: %{name}-utils = %{version}-%{release}

%description -n %{?compat}geant321%{?compiler}
Geant simulates the passage of subatomic particles through matter, for 
instance, particle detectors. For maximum flexibility, Geant simulations 
are performed by linking Fortran code supplied by the user with the Geant 
libraries, then running the resulting executable.

This package includes gxint, the script used to perform this linking step. 

%package -n %{?compat}kuipc%{?compiler}
Summary:  Cernlib's Kit for a User Interface Package (KUIP) compiler
Group:    Development/Languages
Requires: cernlib(devel)

%description -n %{?compat}kuipc%{?compiler}
KUIPC, the Kit for a User Interface Package Compiler, is a tool to simplify 
the writing of a program's user interface code. It takes as input a Command 
Definition File (CDF) that describes the commands to be understood by the 
program, and outputs C or FORTRAN code that makes the appropriate function 
calls to set up the user interface. This code can then be compiled and linked 
with the rest of the program. Since the generated code uses KUIP routines, 
the program must also be linked against the Packlib library that contains them.

# we want to have both g77 and gfortran suffixed utilities available.
%package -n %{?compat}paw%{?compiler_string}
Group: Applications/Engineering
Summary: A program for the analysis and presentation of data

%description -n %{?compat}paw%{?compiler_string}
PAW is conceived as an instrument to assist physicists in the analysis and 
presentation of their data. It provides interactive graphical presentation 
and statistical or mathematical analysis, working on objects familiar to 
physicists like histograms, event files (Ntuples), vectors, etc. PAW is 
based on several components of the CERN Program Library.

%package -n cernlib-packlib%{?compiler_string}
Group: Applications/Archiving
Summary: I/O, network and other utilities from the cernlib

%description -n cernlib-packlib%{?compiler_string}
I/O, network and miscalleneous utilities based on the CERN Program 
Library. 
According to the responsible of the cernlib debian package, some
of these utilities may have security flaws.

%package -n %{?compat}patchy%{?compiler_string}
Group: Applications/Archiving
Summary: The patchy utilities

%description -n %{?compat}patchy%{?compiler_string}
Utilities for extracting sources from patchy cards and cradles.

# the package that has utils_compiler set provides the utilities without
# suffix
%if 0%{?utils_compiler}
%package -n paw
Group: Applications/Engineering
Summary: A program for the analysis and presentation of data

%description -n paw
PAW is conceived as an instrument to assist physicists in the analysis and 
presentation of their data. It provides interactive graphical presentation 
and statistical or mathematical analysis, working on objects familiar to 
physicists like histograms, event files (Ntuples), vectors, etc. PAW is 
based on several components of the CERN Program Library.

%package -n cernlib-packlib
Group: Applications/Archiving
Summary: I/O, network and other utilities from the cernlib

%description -n cernlib-packlib
I/O, network and miscalleneous utilities based on the CERN Program 
Library. 
According to the responsible of the cernlib debian package, some
of these utilities may have security flaws.

%package -n patchy
Group: Applications/Archiving
Summary: The patchy utilities

%description -n patchy
Utilities for extracting sources from patchy cards and cradles.
%endif


%prep
%setup -q -c 



%build

CERN=$RPM_BUILD_DIR/%{name}-%{version}
CERN_LEVEL=%{version}
CERN_ROOT=$CERN/$CERN_LEVEL
CVSCOSRC=$CERN/$CERN_LEVEL/src
PATH=$CERN_ROOT/bin:$PATH

export CERN
export CERN_LEVEL
export CERN_ROOT 
export CVSCOSRC
export PATH

LIB_SONAME=1
export LIB_SONAME

# add something in the soname to avoid binaries linked against g77-compiled
# library to be linked against gfortran-compiled libraries, as the ABI is 
# incompatible for functions.
%if %{with gfortran}
TOOL_SONAME=_gfortran
TOOL_NAME=_gfortran
export TOOL_SONAME
export TOOL_NAME
%endif

# set the CERN and CERN_LEVEL environment variables in shell scripts
# meant to go to /etc/profile.d
sed -e 's/==CERN_LEVEL==/%{verdir}/' -e 's:==CERN==:%{_libdir}/cernlib:' $CERN_ROOT/src/contrib/cernlib.sh.in > cernlib-%{verdir}.sh
sed -e 's/==CERN_LEVEL==/%{verdir}/' -e 's:==CERN==:%{_libdir}/cernlib:' $CERN_ROOT/src/contrib/cernlib.csh.in > cernlib-%{verdir}.csh

# Regenerate the copyright file (from non split debian/rules)
cat  $CERN_ROOT/src/contrib/cernlib.copyright > cernlib.copyright

cd $CERN_ROOT

# substitude the right defaults in the scripts
sed -i.paths -e 's:"/cern":"%{_libdir}/cernlib/":' -e 's:"pro":"%{verdir}":'    src/scripts/paw src/scripts/cernlib src/graflib/dzdoc/dzedit/dzedit.script

%if %{with gfortran}
FC_COMPILER=gfortran
%else
FC_COMPILER=g77
%endif

# substitute version in gxint with the right version
# substitute includedir in gxint to conform to FHS, and gxint.o to gxint.f
# and substitue the name of the cernlib link script
sed -i -e 's/"pro"/%{version}/' -e 's:\${CERN}/\${ver}/lib/gxint\${gvs}\.\$_o:%{_includedir}/cernlib/\${ver}/gxint.f:' \
  -e 's/`cernlib /`cernlib%{?compiler} /' \
  -e 's/"f77"/"'$FC_COMPILER'"/' \
  src/scripts/gxint 

# substitute DATADIR in source files to conform to FHS
sed -i -e 's:DATADIR:%{_datadir}/cernlib/%{version}:' src/geant321/miface/gmorin.F 

# Create the build directory structure
mkdir -p build bin lib shlib

# rename the cernlib script cernlib-static
mv src/scripts/cernlib src/scripts/cernlib-static
%{__install} -p -m755 src/scripts/cernlib-static bin/cernlib-static

# use the debian cernlib script for dynamic libraries support.
# remove -lg2c to the link commands, because libg2c.so isn't available, 
# it is found by g77/gfortran if needed, and similar with -lgfortran.
# don't add {_libdir} to the directory searched in for libraries, 
# since it is already in the list.
sed -e 's:@PREFIX@:%{_prefix}:g' \
  -e 's:@CERN@:%{_libdir}/cernlib:g' \
  -e 's:@VERSION@:%{verdir}:g' \
  -e 's:@LIBPREFIX@::g' \
  -e 's/-lg2c//' \
  -e 's/-lgfortran//' \
  src/contrib/cernlib.in > src/scripts/cernlib

export PATH=$(pwd)/src/scripts/:$PATH

chmod 0755 src/scripts/cernlib
touch -r  $CERN_ROOT/src/contrib/cernlib.in src/scripts/cernlib

# install mkdirhier which is needed to make directories
%{__install} -p -m755  $CERN_ROOT/src/contrib/mkdirhier  bin/

# set FC_OPTFLAGS and FC_COMPILER based on compiler used
%if %{with gfortran}
%if %{?fedora}%{!?fedora:0} >= 32 
FC_OPTFLAGS="%{optflags} -fcommon  -Wno-tabs -Wno-argument-mismatch  -Wno-unused-label -std=legacy -fallow-argument-mismatch -fallow-invalid-boz "
%else
FC_OPTFLAGS="%{optflags} -fcommon  -Wno-tabs -Wno-argument-mismatch -Wno-unused-label -std=legacy"
%endif
FC_COMPILER=gfortran
%else
# optflags are different for g77, so we remove problematic flags
FC_OPTFLAGS=`echo "%optflags" | sed -e 's/-mtune=[^ ]\+//' -e 's/-fstack-protector//' -e 's/--param=ssp-buffer-size=[^ ]\+//'`
# this is needed (at least in F-8).
%if 0%{?no_build_id}
G_LDFLAGS=
%else
G_LDFLAGS='-Wl,--build-id'
%endif
FC_COMPILER=g77
%endif

PATHSAVE=$PATH


export PATH=$PATHSAVE

rm -rf ${CVSCOSRC}/config/host.def
touch ${CVSCOSRC}/config/host.def
echo '#define ArCmd ArCmdBase clq' >> ${CVSCOSRC}/config/host.def
echo '#define DISTRO 1' >> ${CVSCOSRC}/config/host.def
%if %{?rhel}%{!?rhel:0} >= 8
echo '#define DefaultCDebugFlags %{optflags} -DIEC_60559_BFP_EXT=0 -Wno-cpp -Wno-unused-function -Wno-unused-variable -Wno-missing-braces -Wno-maybe-uninitialized -Wno-implicit-function-declaration -Wno-implicit-int' >> ${CVSCOSRC}/config/host.def
echo '#define DefaultCCOptions   %{optflags} -DIEC_60559_BFP_EXT=0 -Wno-cpp -Wno-unused-function -Wno-unused-variable -Wno-missing-braces -Wno-maybe-uninitialized -Wno-implicit-function-declaration -Wno-implicit-int' >> ${CVSCOSRC}/config/host.def
%else
echo '#define DefaultCDebugFlags %{optflags} -D_GNU_SOURCE         -Wno-cpp -Wno-unused-function -Wno-unused-variable -Wno-missing-braces -Wno-maybe-uninitialized -Wno-implicit-function-declaration -Wno-implicit-int' >> ${CVSCOSRC}/config/host.def
echo '#define DefaultCCOptions   %{optflags} -D_GNU_SOURCE         -Wno-cpp -Wno-unused-function -Wno-unused-variable -Wno-missing-braces -Wno-maybe-uninitialized -Wno-implicit-function-declaration -Wno-implicit-int' >> ${CVSCOSRC}/config/host.def
%endif


%if %{with gfortran}
echo '#define Hasgfortran YES' >> ${CVSCOSRC}/config/host.def
%endif

%if %{?fedora}%{!?fedora:0} >= 32 
echo "#define FortranDebugFlags $FC_OPTFLAGS -std=legacy -fallow-argument-mismatch -fallow-invalid-boz -fcommon  -Wno-unused-variable -Wno-tabs -Wno-argument-mismatch -Wno-conversion -Wno-unused-dummy-argument" >> ${CVSCOSRC}/config/host.def
echo "#define DefaultFCOptions $FC_OPTFLAGS -std=legacy -fallow-argument-mismatch -fallow-invalid-boz -fcommon  -Wno-unused-variable -Wno-tabs -Wno-argument-mismatch -Wno-conversion -Wno-unused-dummy-argument" >> ${CVSCOSRC}/config/host.def
%else
echo "#define FortranDebugFlags $FC_OPTFLAGS -std=legacy                                               -fcommon  -Wno-unused-variable -Wno-tabs -Wno-argument-mismatch -Wno-conversion -Wno-unused-dummy-argument" >> ${CVSCOSRC}/config/host.def
echo "#define DefaultFCOptions $FC_OPTFLAGS -std=legacy                                               -fcommon  -Wno-unused-variable -Wno-tabs -Wno-argument-mismatch -Wno-conversion -Wno-unused-dummy-argument" >> ${CVSCOSRC}/config/host.def
%endif
# keep timestamps
echo "#define InstallCmd %{__install} -p" >> ${CVSCOSRC}/config/host.def
# don't strip executables
echo "#define InstPgmFlags -m 0755" >> ${CVSCOSRC}/config/host.def

# optflags are doubled for programs because they are in FortranDebugFlags
# and below, but they are not doubled for libs.
echo "#define FortranLinkCmd $FC_COMPILER $FC_OPTFLAGS $G_LDFLAGS" >> ${CVSCOSRC}/config/host.def

# Create the top level Makefile with imake
cd $CERN_ROOT/build
$CVSCOSRC/config/imake_boot

make tree
cd $CERN_ROOT/build/patchy4
make install.lib
export PATH="$CERN/patchy:$CERN/patchy4/p4sub:$PATH" 
export PATH=".:..:$PATH" 
make install.bin

cd $CERN_ROOT/build
# Install kuipc and the scripts (cernlib, paw and gxint) in $CERN_ROOT/bin

#  %{?_smp_mflags} breaks the builds
make -s bin/kuipc
make -s scripts/Makefile
# make Makefiles that are not done automatically now

cd $CERN_ROOT/build

cd scripts
make -s install.bin

# Install the libraries

cd $CERN_ROOT/build
make -s 
make -s install.shlib
chmod a+x ../shlib/*.so.*

# Build dynamic paw
cd $CERN_ROOT/build/pawlib
make -s install.bin
cd $CERN_ROOT/
mv bin/pawX11 bin/pawX11.dynamic
mv bin/paw++ bin/paw++.dynamic

# Build static paw
$FC_COMPILER $FC_OPTFLAGS $G_LDFLAGS $CERN_ROOT/build/pawlib/paw/programs/0pamain.o    `cernlib -G X11 pawlib` -Wl,-E -o bin/pawX11
$FC_COMPILER $FC_OPTFLAGS $G_LDFLAGS $CERN_ROOT/build/pawlib/paw/programs/0pamainm.o   `cernlib -G Motif pawlib` -Wl,-E -o bin/paw++

# Build packlib
cd $CERN_ROOT/build/packlib
make -s install.bin

cd $CERN_ROOT/build/graflib
make -s install.bin

# we cannot use %%{?_smp_mflags} because fcasplit is used after being
# built, and during the fcasplit installation (which is done in parallel 
# with the build) it is removed and replaced by a symlink, and if it 
# takes time the link may not be there on time. 
# At least that's my understanding of the failure.


cd $CERN_ROOT/build/patchy5
make -s install.bin


# it is not completly obvious that it is better to use patchy 4 for 
# ypatchy, but that's what we do. In any case it should be replaced by a
# link to the final npatchy
#rm -f $CERN_ROOT/bin/ypatchy
#rm -f $CERN_ROOT/bin/ypatchy-gfortran


%install

rm -rf %{buildroot}

%{__install} -d -m755 %{buildroot}%{_sysconfdir}/profile.d

%{__install} -d -m755 cfortran/Examples
%{__install} -p -m644 %{version}/src/cfortran/Examples/*.c cfortran/Examples/

%{__install} -d -m755 %{buildroot}%{_datadir}/aclocal
%{__install} -p -m644 %{version}/src/contrib/cernlib.m4 %{buildroot}%{_datadir}/aclocal/cernlib.m4

# copy patchy executables in bin. Keep the timestamps for the scripts.
%{__install} -d -m755 %{buildroot}%{_bindir}/
find %{version}/src/patchy4 -name y* -a -perm -755 -exec %{__install} -p -m755 {} %{buildroot}%{_bindir} ';'
find %{version}/src/patchy5 -name y* -a -perm -755 -exec %{__install} -p -m755 {} %{buildroot}%{_bindir} ';'

cd %{version}
# fix generated data file timestamps such that they are the same for all 
# compilers
touch -r src/mclibs/cojets/data/cojets.cpp lib/cojets.dat
touch -r src/mclibs/isajet/data/decay.cpp lib/isajet.dat
touch -r src/mclibs/eurodec/data/eurodec.dat lib/eurodec.dat

%{__install} -d -m755 %{buildroot}%{_libdir}/cernlib/%{verdir}/lib
%{__install} -d -m755 %{buildroot}%{_datadir}/cernlib/%{version}
%{__install} -d -m755 %{buildroot}%{_includedir}/cernlib/%{version}
%{__install} -d -m755 %{buildroot}%{_includedir}/cernlib/%{version}/cfortran

%{__install} -p -m644 lib/*.dat %{buildroot}%{_datadir}/cernlib/%{version}
 
%{__install} -p -m644 lib/gxint321.f %{buildroot}%{_includedir}/cernlib/%{version}
%{__install} -p -m644 src/cfortran/*.h %{buildroot}%{_includedir}/cernlib/%{version}/

%{__install} -p -m755 bin/* %{buildroot}%{_bindir}/


# avoid name conflicts for files in bin
# first move kuipc, cernlib and gxint scripts out of the way
for file in cernlib cernlib-static gxint kuipc; do
   mv %{buildroot}%{_bindir}/$file $file%{?compiler}
done

# always ship suffixed utilities
for file in %{buildroot}%{_bindir}/*; do
   cp -p $file ${file}%{compiler_string}
   # and not suffixed utilities only for one compiler 
   if [ 'z%{?utils_compiler}' != 'z1' ]; then
     rm $file
   fi
done

# move gxint and cernlib scripts back
mv cernlib%{?compiler} cernlib-static%{?compiler} gxint%{?compiler} kuipc%{?compiler}\
   %{buildroot}%{_bindir}/

# add a link to pawX11 and dzeX11 from {_libdir}/cernlib/{verdir}/bin
%{__install} -d -m755 %{buildroot}%{_libdir}/cernlib/%{verdir}/bin/
%{__ln_s} %{_bindir}/pawX11%{?compiler_string} %{buildroot}%{_libdir}/cernlib/%{verdir}/bin/pawX11%{?compiler_string}
%{__ln_s} %{_bindir}/dzeX11%{?compiler_string} %{buildroot}%{_libdir}/cernlib/%{verdir}/bin/dzeX11%{?compiler_string}

# fix utilities names in calling scripts
sed -i -e 's:$GDIR/paw$drv:$GDIR/paw$drv%{compiler_string}:' %{buildroot}%{_bindir}/paw%{compiler_string}
sed -i -e 's:$GDIR/dze$drv:$GDIR/dze$drv%{compiler_string}:' %{buildroot}%{_bindir}/dzedit%{compiler_string}

%if 0%{?utils_compiler}
   %{__ln_s} %{_bindir}/pawX11 %{buildroot}%{_libdir}/cernlib/%{verdir}/bin/pawX11
   %{__ln_s} %{_bindir}/dzeX11 %{buildroot}%{_libdir}/cernlib/%{verdir}/bin/dzeX11
%endif

# to preserve symlinks and timestamps
(cd lib && tar cf - *.a) | (cd %{buildroot}%{_libdir}/cernlib/%{verdir}/lib && tar xf -)
(cd shlib && tar cf - *.so*) | (cd %{buildroot}%{_libdir}/cernlib/%{verdir}/lib && tar xf -)

rm %{buildroot}%{_bindir}/mkdirhier*

# add links for cfortran header files in the top include directory
pushd %{buildroot}%{_includedir}/cernlib/%{version}
for file in *.h; do
   %{__ln_s} ../$file cfortran/$file
done
%{__ln_s} gxint321.f gxint.f
popd

cd src
# install include directories for the cernlib libraries
base_include=%{buildroot}%{_includedir}/cernlib/%{version}
cat << EOF > 1.txt 
geant321/geant321
graflib/dzdoc/dzdoc
graflib/higz/higz
graflib/hplot/hplot
kernlib/kernbit/kernbit
kernlib/kerngen/kerngen
kernlib/kernnum/kernnum
mathlib/gen/gen
mclibs/cojets/cojets
mclibs/eurodec/eurodec
mclibs/herwig/herwig59
mclibs/isajet/isajet
mclibs/pdf/pdf
packlib/cspack/cspack
packlib/epio/epio
packlib/fatmen/fatmen
packlib/ffread/ffread
mathlib/hbook/hbook
packlib/hepdb/hepdb
packlib/kapack/kapack
packlib/kuip/kuip
packlib/minuit/minuit
packlib/zbook/zbook
packlib/zebra/zebra
pawlib/comis/comis
pawlib/paw/ntuple
pawlib/paw/paw
pawlib/sigma/sigma
EOF

for dir in `cat 1.txt`; do
   basedir=`basename $dir`
   rm -rf $base_include/$basedir
   cp -Rp $dir $base_include/
done

# patching of header files changed their timestamp. However, since it 
# is much more complicated, instead of finding the real timestamp, the 
# source file timestamp is used

# substitute the path in installed eufiles.inc, not in in-source
# file, because in-source the relative path is required for test
touch -r %{buildroot}%{_includedir}/cernlib/%{version}/eurodec/eufiles.inc __eufiles_timestamp
sed -i -e 's:eurodec.dat:%{_datadir}/cernlib/%{version}/eurodec.dat:' \
  %{buildroot}%{_includedir}/cernlib/%{version}/eurodec/eufiles.inc
touch -r __eufiles_timestamp %{buildroot}%{_includedir}/cernlib/%{version}/eurodec/eufiles.inc
rm __eufiles_timestamp

# install the tree.h and converter.h include files redirecting to system headers
%{__install} -p -m644 contrib/tree.h %{buildroot}%{_includedir}/cernlib/%{version}/paw/
%{__install} -p -m644 contrib/converter.h %{buildroot}%{_includedir}/cernlib/%{version}/paw/

%{__install} -d -m755 %{buildroot}/etc/ld.so.conf.d
echo %{_libdir}/cernlib/%{verdir}/lib > %{buildroot}/etc/ld.so.conf.d/cernlib-%{verdir}-%{_arch}.conf

pushd contrib/man/man8/
for a in $(ls -1); do
gzip $a;
done
popd
pushd contrib/man/man1/
for a in $(ls -1); do
gzip $a;
done
pushd

%{__install} -d -m755 %{buildroot}/%{_mandir}/man8
for cernlib_manpage in `ls -1 contrib/man/man8`; do
	%{__install} -p -m644 contrib/man/man8/$cernlib_manpage %{buildroot}/%{_mandir}/man8/
done
%{__install} -d -m755 %{buildroot}/%{_mandir}/man1
for cernlib_manpage in `ls -1 contrib/man/man1`; do
	%{__install} -p -m644 contrib/man/man1/$cernlib_manpage %{buildroot}/%{_mandir}/man1/
done


%{__install} -d -m755 %{buildroot}/%{_datadir}/X11/app-defaults
%{__install} -p -m644 contrib/X11/app-defaults/* %{buildroot}/%{_datadir}/X11/app-defaults/

#sed -e 's/Exec=paw++/Exec=paw++%{?compiler_string}/' -e 's/Paw++/Paw++#{?compiler_string}/' \
# ../../paw*/debian/add-ons/misc/paw++.desktop > paw++#{?compiler_string}.desktop
#desktop-file-install --vendor="fedora"               \
#  --dir=%{buildroot}/%{_datadir}/applications         \
#  --delete-original                                   \
#  paw++{?compiler_string}.desktop

#if 0#{?utils_compiler}
#desktop-file-install --vendor="fedora"               \
#  --dir=%{buildroot}/#{_datadir}/applications         \
#  ../../paw*/debian/add-ons/misc/paw++.desktop
#endif

%{__install} -d -m755 %{buildroot}/%{_datadir}/pixmaps
%{__install} -d -m755 %{buildroot}/%{_datadir}/icons/hicolor/{48x48,32x32}/apps/
%{__install} -p -m644 contrib/pixmaps/*.xpm %{buildroot}/%{_datadir}/pixmaps/
%{__install} -p -m644 contrib/icons/hicolor/32x32/apps/paw.xpm %{buildroot}/%{_datadir}/icons/hicolor/32x32/apps/paw.xpm
%{__install} -p -m644 contrib/icons/hicolor/48x48/apps/paw.xpm %{buildroot}/%{_datadir}/icons/hicolor/48x48/apps/paw.xpm

find %{buildroot}%{_includedir}/cernlib/%{version} -name 'Imakefile*' -exec rm \{\} \;
rm %{buildroot}%{_includedir}/cernlib/%{version}/ntuple/*.c

%check
CERN=$RPM_BUILD_DIR/%{name}-%{version}
CERN_LEVEL=%{version}
CERN_ROOT=$CERN/$CERN_LEVEL
CVSCOSRC=$CERN/$CERN_LEVEL/src
PATH=$CERN_ROOT/bin:$PATH

export CERN
export CERN_LEVEL
export CERN_ROOT
export CVSCOSRC
export PATH

export LD_LIBRARY_PATH=$CERN_ROOT/shlib/

# cannot make out-of build test because of the data files
cd $CERN_ROOT/build

# no test in code_motif paw_motif scripts patchy pawlib
%if  %{?rhel}%{!?rhel:0} >= 7
test_dirs='graflib mclibs kernlib mathlib packlib phtools'
%else
test_dirs='graflib mclibs kernlib mathlib packlib phtools geant321'
%endif

rm -f __dist_failed_builds

for dir in $test_dirs; do
make  -s -C $dir test || echo $dir >> __dist_failed_builds
done

if [ -f __dist_failed_builds ]; then
echo "DIST TESTS FAILED"
cat __dist_failed_builds
fi

%clean
rm -rf %{buildroot}

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%post -n %{?compat}paw%{?compiler_string}
touch --no-create %{_datadir}/icons/hicolor || :
%{_bindir}/gtk-update-icon-cache --quiet %{_datadir}/icons/hicolor || :

%postun -n %{?compat}paw%{?compiler_string}
touch --no-create %{_datadir}/icons/hicolor || :
%{_bindir}/gtk-update-icon-cache --quiet %{_datadir}/icons/hicolor || :

%if 0%{?utils_compiler}
%post -n paw
touch --no-create %{_datadir}/icons/hicolor || :
%{_bindir}/gtk-update-icon-cache --quiet %{_datadir}/icons/hicolor || :

%postun -n paw
touch --no-create %{_datadir}/icons/hicolor || :
%{_bindir}/gtk-update-icon-cache --quiet %{_datadir}/icons/hicolor || :
%endif

%files
%defattr(-,root,root,-)
%doc cernlib.copyright
%doc %{version}/src/contrib/geant321.README
%doc %{version}/src/contrib/vim/
/etc/ld.so.conf.d/*
%dir %{_libdir}/cernlib/
%dir %{_libdir}/cernlib/%{verdir}
%dir %{_libdir}/cernlib/%{verdir}/lib
%dir %{_libdir}/cernlib/%{verdir}/bin
%{_libdir}/cernlib/%{verdir}/lib/*.so.*
%{_datadir}/cernlib/

# the utils and devel are separated to have the possibility to install
# parallel versions of the library
%files devel
%defattr(-,root,root,-)
%doc cfortran %{version}/src/contrib/comis-64bit-example.F
%{_libdir}/cernlib/%{verdir}/lib/*.so
%{_includedir}/cernlib/
%{_datadir}/aclocal/cernlib.m4

%files static
%defattr(-,root,root,-)
%{_libdir}/cernlib/%{verdir}/lib/*.a

%files utils
%defattr(-,root,root,-)
%doc cernlib-%{verdir}.csh cernlib-%{verdir}.sh
%{_bindir}/cernlib*%{?compiler}
# %%{_sysconfdir}/profile.d/cernlib-%%{verdir}.sh
# %%{_sysconfdir}/profile.d/cernlib-%%{verdir}.csh
%{_mandir}/man1/cernlib*.1*


%files -n %{?compat}geant321%{?compiler}
%defattr(-,root,root,-)
%{_bindir}/gxint%{?compiler}
%{_datadir}/X11/app-defaults/*Geant++
%{_mandir}/man1/gxint.1*

%files -n %{?compat}kuipc%{?compiler}
%defattr(-,root,root,-)
%{_bindir}/kuipc%{?compiler}
%{_mandir}/man1/kuipc.1*

%files -n %{?compat}paw%{?compiler_string}
%defattr(-,root,root,-)
%{_bindir}/paw++%{?compiler_string}
%{_bindir}/paw%{?compiler_string}
%{_bindir}/pawX11%{?compiler_string}
%{_bindir}/pawX11.dynamic%{?compiler_string}
%{_bindir}/paw++.dynamic%{?compiler_string}
# paw doesn't explicitly depend on the main package, so it owns the dirs
%dir %{_libdir}/cernlib/%{verdir}
%dir %{_libdir}/cernlib/%{verdir}/bin
%{_libdir}/cernlib/%{verdir}/bin/pawX11%{?compiler_string}
%{_datadir}/X11/app-defaults/*Paw++
%{_datadir}/icons/hicolor/
%{_mandir}/man1/paw*.1*
#{_datadir}/applications/*paw++{?compiler_string}.desktop
%{_datadir}/pixmaps/paw*.xpm

%files -n cernlib-packlib%{?compiler_string}
%defattr(-,root,root,-)
%doc %{version}/src/contrib/zftp.README
%{_bindir}/cdbackup%{?compiler_string}
%{_bindir}/cdserv%{?compiler_string}
%{_bindir}/dzedit%{?compiler_string}
# packlib doesn't explicitly depend on the main package, so it owns the dirs
%dir %{_libdir}/cernlib/%{verdir}
%dir %{_libdir}/cernlib/%{verdir}/bin
%{_libdir}/cernlib/%{verdir}/bin/dzeX11%{?compiler_string}
%{_bindir}/dzeX11%{?compiler_string}
%{_bindir}/fatmen%{?compiler_string}
%{_bindir}/fatsrv%{?compiler_string}
%{_bindir}/kuesvr%{?compiler_string}
%{_bindir}/zserv%{?compiler_string}
%{_bindir}/cdmake%{?compiler_string}
%{_bindir}/fatnew%{?compiler_string}
%{_bindir}/pawserv%{?compiler_string}
%{_bindir}/cdmove%{?compiler_string}
%{_bindir}/fatback%{?compiler_string}
%{_bindir}/fatsend%{?compiler_string}
%{_bindir}/hepdb%{?compiler_string}
%{_bindir}/kxterm%{?compiler_string}
%{_bindir}/zftp%{?compiler_string}
%{_datadir}/X11/app-defaults/KXterm
%{_datadir}/pixmaps/kxterm*.xpm
%{_mandir}/man1/kxterm.1* 
%{_mandir}/man1/dze*.1*
%{_mandir}/man1/kuesvr.1* 
%{_mandir}/man1/zftp.1*
%{_mandir}/man8/*.8*

%files -n %{?compat}patchy%{?compiler_string}
%defattr(-,root,root,-)
%{_bindir}/fcasplit%{?compiler_string}
%{_bindir}/nycheck%{?compiler_string}
%{_bindir}/nydiff%{?compiler_string}
%{_bindir}/nyindex%{?compiler_string}
%{_bindir}/nylist%{?compiler_string}
%{_bindir}/nymerge%{?compiler_string}
%{_bindir}/nypatchy%{?compiler_string}
%{_bindir}/nyshell%{?compiler_string}
%{_bindir}/nysynopt%{?compiler_string}
%{_bindir}/nytidy%{?compiler_string}
%{_bindir}/yexpand*
#{_bindir}/yexpand{?compiler_string}
%{_bindir}/ycompar%{?compiler_string}
%{_bindir}/yedit%{?compiler_string}
%{_bindir}/yfrceta%{?compiler_string}
#{_bindir}/yindex{?compiler_string}
%{_bindir}/yindexb%{?compiler_string}
#{_bindir}/ylist{?compiler_string}
%{_bindir}/ylistb%{?compiler_string}
%{_bindir}/ypatchy%{?compiler_string}
%{_bindir}/ysearch%{?compiler_string}
%{_bindir}/yshift%{?compiler_string}
%{_bindir}/ytobcd%{?compiler_string}
%{_bindir}/ytobin%{?compiler_string}
%{_bindir}/ytoceta%{?compiler_string}
%{_mandir}/man1/ny*.1*
%{_mandir}/man1/yexpand.1* 
%{_mandir}/man1/ypatchy.1*

%if 0%{?utils_compiler}
%files -n paw
%defattr(-,root,root,-)
%{_bindir}/paw++
%{_bindir}/paw
%{_bindir}/pawX11
%{_bindir}/pawX11.dynamic
%{_bindir}/paw++.dynamic
# paw doesn't explicitly depend on the main package, so it owns the dirs
%dir %{_libdir}/cernlib/%{verdir}
%dir %{_libdir}/cernlib/%{verdir}/bin
%{_libdir}/cernlib/%{verdir}/bin/pawX11
%{_datadir}/X11/app-defaults/*Paw++
%{_datadir}/icons/hicolor/
%{_mandir}/man1/paw*.1*
#{_datadir}/applications/*paw++.desktop
%{_datadir}/pixmaps/paw*.xpm

%files -n cernlib-packlib
%defattr(-,root,root,-)
%doc %{version}/src/contrib/zftp.README
%{_bindir}/cdbackup
%{_bindir}/cdserv
%{_bindir}/dzedit
# packlib doesn't explicitly depend on the main package, so it owns the dirs
%dir %{_libdir}/cernlib/%{verdir}
%dir %{_libdir}/cernlib/%{verdir}/bin
%{_libdir}/cernlib/%{verdir}/bin/dzeX11
%{_bindir}/dzeX11
%{_bindir}/fatmen
%{_bindir}/fatsrv
%{_bindir}/kuesvr
%{_bindir}/zserv
%{_bindir}/cdmake
%{_bindir}/fatnew
%{_bindir}/pawserv
%{_bindir}/cdmove
%{_bindir}/fatback
%{_bindir}/fatsend
%{_bindir}/hepdb
%{_bindir}/kxterm
%{_bindir}/zftp
%{_datadir}/X11/app-defaults/KXterm
%{_datadir}/pixmaps/kxterm*.xpm
%{_mandir}/man1/kxterm.1* 
%{_mandir}/man1/dze*.1*
%{_mandir}/man1/kuesvr.1* 
%{_mandir}/man1/zftp.1*
%{_mandir}/man8/*.8*

%files -n patchy
%defattr(-,root,root,-)
%{_bindir}/fcasplit
%{_bindir}/nycheck
%{_bindir}/nydiff
%{_bindir}/nyindex
%{_bindir}/nylist
%{_bindir}/nymerge
%{_bindir}/nypatchy
%{_bindir}/nyshell
%{_bindir}/nysynopt
%{_bindir}/nytidy
%{_bindir}/yexpand
%{_bindir}/ycompar
%{_bindir}/yedit
%{_bindir}/yfrceta
#{_bindir}/yindex
%{_bindir}/yindexb
#{_bindir}/ylist
%{_bindir}/ylistb
%{_bindir}/ypatchy
%{_bindir}/ysearch
%{_bindir}/yshift
%{_bindir}/ytobcd
%{_bindir}/ytobin
%{_bindir}/ytoceta
%{_mandir}/man1/ny*.1*
%{_mandir}/man1/yexpand.1* 
%{_mandir}/man1/ypatchy.1*
%endif

%changelog
* Mon Jul 18 2022 Ulrich Schwickerath <ulrich.schwickerath@cern.ch> 2022-10
 - bump version
* Tue Dec 1 2020 Andrii Verbytskyi <andrii.verbytskyi@mpp.mpg.de> 2006-43
 - Adding CentOS7/CentOS8 support
