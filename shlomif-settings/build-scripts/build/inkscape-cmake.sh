#!/usr/bin/env bash
build_type=''
if test "$DEBUG" = "1"
then
    build_type='-DCMAKE_BUILD_TYPE=Debug'
fi

ninja='-G Ninja'
if test "$NO_NINJA" = "1"
then
    ninja=''
fi

prefix="$HOME/apps/graphics/inkscape-trunk"
# prefix="/opt/`whoami`/inkscape-trunk"

cmake \
    $ninja \
    $build_type \
    -DBUILD_TESTING=ON \
    -DCMAKE_CXX_FLAGS="-fpermissive" \
    -DCMAKE_INSTALL_PREFIX="$prefix" \
    -DENABLE_LCMS=ON \
    -DENABLE_POPPLER_CAIRO=ON \
    -DWITH_GRAPHICS_MAGICK=ON \
    -DWITH_JEMALLOC=ON \
    -DWITH_LIBCDR=ON \
    -DWITH_LIBSPELLING=OFF \
    -DWITH_OPENMP=ON \
    $flags \
    "$@"
