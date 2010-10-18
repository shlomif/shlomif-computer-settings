#!/bin/bash
# Choqok is a micro-blogging client for KDE.
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/choqok" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ..
