#!/bin/bash
set -x
./configure "$@" --prefix=$HOME/apps/vim \
    --enable-fail-if-missing \
    --with-features=huge \
    --enable-perlinterp --enable-pythoninterp --enable-rubyinterp \
    --enable-tclinterp \
