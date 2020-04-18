#!/usr/bin/env bash
set -x
./configure "$@" --prefix=$HOME/apps/vim \
    --enable-fail-if-missing \
    --with-features=huge \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-tclinterp \
    --enable-gui=gtk3 \

