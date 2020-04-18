#!/usr/bin/env bash
# cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/neovim" "$1"
# echo "You should really be using the bootstrapping makefile" 1>&2
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$HOME/apps/neovim" "$@"
# cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH="$HOME/apps/neovim" "$@"
