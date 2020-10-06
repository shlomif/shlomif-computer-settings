#!/usr/bin/env bash
# cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/neovim" "$1"
# echo "You should really be using the bootstrapping makefile" 1>&2
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/apps/neovim"
