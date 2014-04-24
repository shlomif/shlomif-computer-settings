#!/bin/bash
build_type=''
if test "$DEBUG" = 1 ; then
    build_type='-DCMAKE_BUILD_TYPE=Debug'
fi
cmake -G Ninja $build_type -DCMAKE_INSTALL_PREFIX="$HOME/apps/graphics/inkscape-trunk" -DENABLE_LCMS=ON -DCMAKE_CXX_FLAGS="-fpermissive" -DENABLE_POPPLER=OFF -DENABLE_POPPLER_CAIRO=OFF ../inkscape/
