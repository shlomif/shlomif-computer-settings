#!/usr/bin/env bash
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$HOME/apps/file/libgringotts/lib/pkgconfig/"
build_type=''
if test "$DEBUG" = 1 ; then
    build_type='-DCMAKE_BUILD_TYPE=Debug'
fi
# flags=''

ninja='-G Ninja'
if test "$NO_NINJA" = 1 ; then
    ninja=''
fi

prefix="$HOME/apps/file/gringotts"
cmake $ninja $build_type -DCMAKE_INSTALL_PREFIX="$prefix" $flags "$@"
