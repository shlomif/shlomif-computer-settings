#!/bin/bash

if ! test -e build ; then
    mkdir build
fi

cd build
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/perl" \
    -DCUSTOM_PERL_SITE_ARCH_DIR="$HOME/apps/perl" \
    -DCMAKE_BUILD_TYPE="debug" \
    -DENABLE_SMOKE="OFF" \
    ..

