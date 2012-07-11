#!/bin/bash
if ! test -e build ; then
    mkdir build
fi
cd build
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/cmake-git" ..
