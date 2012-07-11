#!/bin/bash
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/multimedia/kaffeine-svn" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ..
