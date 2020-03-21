#!/usr/bin/env bash
~/Download/unpack/prog/c/gcc/gcc-7.5.0/configure \
    --prefix="$HOME"/apps/prog/gcc-7.5.0 \
    --enable-languages="c,c++" --disable-multilib
