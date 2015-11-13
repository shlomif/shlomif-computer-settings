#!/bin/bash
export CFLAGS="-O3 -march=native -fomit-frame-pointer -flto -fwhole-program"
export CXXFLAGS="$CFLAGS"
./configure --prefix="$HOME/apps/primesieve"
