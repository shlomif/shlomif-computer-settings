#!/usr/bin/env bash
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/kflickr" \
    -DCMAKE_CXX_FLAGS_DEBUG=1 \
    ..
