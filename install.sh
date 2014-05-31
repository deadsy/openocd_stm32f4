#! /bin/bash

VERSION=0.8.0
OPENOCD=openocd-$VERSION

pushd $OPENOCD
sudo make install
popd
