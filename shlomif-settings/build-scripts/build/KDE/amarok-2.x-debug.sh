#!/bin/bash
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="/opt/amarok" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ..
