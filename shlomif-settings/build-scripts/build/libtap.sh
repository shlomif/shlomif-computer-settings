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

prefix="/opt/vlc-3.0/libtap"
cmake $ninja $build_type -DCMAKE_INSTALL_PREFIX="$prefix" $flags "$@"
