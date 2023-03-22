#!/bin/bash


mkdir -p LIBS/i 
mkdir -p LIBS/c
cp  tmp/cern/new/lib/lib*a LIBS/i
cp $(find  TEMP/2022/src/BUILDGNU/ | grep 'lib.*\.a' | grep -v test | grep -v symlinks)  LIBS/c/
libs=( libariadne  libeurodec  libgeant321  libgrafX11   libisajet758  libkernlib   libmathlib    libphotos202  libpythia6205
libcojets   libfritiof  libgraflib   libherwig59  libjetset74   liblepto651  libp4lib    libpacklib       libpawlib           libpdflib804       libphtools )
#libs=(  libgraflib )

TOP=$(pwd)

for li in "${libs[@]}"; do
cd $TOP
mkdir -p LIBS/STRIPPED/i
mkdir -p LIBS/STRIPPED/c

mkdir -p $TOP/LIBS/MD5/c
mkdir -p $TOP/LIBS/MD5/i

set -x
cd $TOP
mkdir -p LIBS/STRIPPED/i/$li
cp LIBS/i/$li.a LIBS/STRIPPED/i/$li
cd LIBS/STRIPPED/i/$li
ar -x $li.a
rm -rf $li.a
for a in $(ls -1 ./ ); do
strip -d $a;
done
for a in $(ls -1 ./ ); do
b=$(echo $a | cut -f 1 -d.)
mv $a $b
done
for a in $(ls -1 ./ ); do
#md5sum $a >>  $TOP/LIBS/MD5/i/$li.sumtxt
objdump -d $a > $a.as
md5sum $a.as >>  $TOP/LIBS/MD5/i/$li.sumtxt
done



cd $TOP
mkdir -p LIBS/STRIPPED/c/$li
cp LIBS/c/$li.a LIBS/STRIPPED/c/$li
cd LIBS/STRIPPED/c/$li
ar -x $li.a
rm -rf $li.a
for a in $(ls -1 ./ ); do
strip -d $a;
done
for a in $(ls -1 ./ ); do
b=$(echo $a | cut -f 1 -d.)
mv $a $b
done
for a in $(ls -1 ./ ); do
#md5sum $a >>  $TOP/LIBS/MD5/c/$li.sumtxt
objdump -d $a > $a.as
md5sum $a.as >>  $TOP/LIBS/MD5/c/$li.sumtxt
done

done
