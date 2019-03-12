#!/usr/bin/env bash
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="/opt/clementine" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ..
