#!/usr/bin/env bash
build_type=''
if test "$DEBUG" = 1 ; then
    build_type='-DCMAKE_BUILD_TYPE=Debug'
fi
# flags=''

ninja='-G Ninja'
if test "$NO_NINJA" = 1 ; then
    ninja=''
fi

prefix="$HOME/apps/graphics/inkscape-trunk"
prefix="/opt/`whoami`/inkscape-trunk"
cmake $ninja $build_type -DCMAKE_INSTALL_PREFIX="$prefix" -DENABLE_LCMS=ON -DCMAKE_CXX_FLAGS="-fpermissive" -DENABLE_POPPLER=ON -DENABLE_POPPLER_CAIRO=ON -DWITH_DBUS=ON -DWITH_JEMALLOC=ON -DWITH_GRAPHICS_MAGICK=ON -DWITH_OPENMP=ON -DWITH_LIBCDR=ON -DWITH_GTKSPELL=ON  -DBUILD_TESTING=ON $flags "$@"
