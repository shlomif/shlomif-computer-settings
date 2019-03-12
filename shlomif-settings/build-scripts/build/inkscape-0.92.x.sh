#!/usr/bin/env bash
build_type=''
if test "$DEBUG" = 1 ; then
    build_type='-DCMAKE_BUILD_TYPE=Debug'
fi
# flags='-DWITH_GTK3_EXPERIMENTAL=ON'
flags=''

ninja='-G Ninja'
if test "$NO_NINJA" = 1 ; then
    ninja=''
fi

cmake $ninja $build_type -DCMAKE_INSTALL_PREFIX="$HOME/apps/graphics/inkscape-0.92" -DENABLE_LCMS=ON -DCMAKE_CXX_FLAGS="-fpermissive" -DENABLE_POPPLER=ON -DENABLE_POPPLER_CAIRO=ON -DWITH_DBUS=ON -DWITH_MESH=ON $flags "$@"
