#! /bin/bash

VERSION=0.8.0
OPENOCD=openocd-$VERSION
TBZ=$OPENOCD.tar.bz2

echo "extracting source from $TBZ"
rm -rf $OPENOCD
tar jxf $TBZ

echo "apply patches from ./patches"
PATCHFILES=`ls ./patches/*.patch`
for f in $PATCHFILES; do
    patch -b -z .original -d $OPENOCD -p0 < $f
done

echo "copy source files from ./files"
cp -r ./files/* $OPENOCD

pushd $OPENOCD
autoreconf --force --install
./configure
make
popd

echo "run \"sudo make install\" to install to /usr/local/bin"
