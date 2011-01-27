#!/bin/bash
./configure --prefix=$HOME/apps/vim --with-features=huge \
    --enable-perlinterp --enable-pythoninterp --enable-rubyinterp \
    --enable-tclinterp --enable-luainterp
