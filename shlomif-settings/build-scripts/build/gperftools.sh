#!/usr/bin/env bash
set -x
export CFLAGS="-O3 -march=native"
export CXXFLAGS="$CFLAGS"
./configure "$@" --prefix=$HOME/apps/gperftools
