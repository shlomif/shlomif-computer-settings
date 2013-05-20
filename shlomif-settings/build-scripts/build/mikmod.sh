#!/bin/bash
lmm_base="$HOME/apps/multimedia/libmikmod"
export LD_LIBRARY_PATH="$lmm_base/lib"
export PATH="$lmm_base/bin:$PATH"

./configure --prefix=$HOME/apps/multimedia/mikmod \
    --with-libmikmod-prefix="$lmm_base"
