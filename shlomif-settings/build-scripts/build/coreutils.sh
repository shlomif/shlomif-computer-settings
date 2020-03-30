#!/usr/bin/env bash
# export CC="/usr/bin/gcc"
export CFLAGS="-O3 -march=native -flto -fwhole-program -fomit-frame-pointer"
export CFLAGS="-O3 -march=native -fwhole-program -fomit-frame-pointer"
export CFLAGS="-O3 -march=native"
./configure --prefix="$HOME/apps/to-del-coreutils"
