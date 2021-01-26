#! /usr/bin/env bash
#
# emcc-emsdk-update-all.bash
# Copyright (C) 2020 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

set -e -x
target_repo=~/Download/unpack/prog/llvm-to-js/emsdk/
if ! test -d "$target_repo"
then
    mkdir -p "$(dirname "$target_repo")"
    git clone "https://github.com/emscripten-core/emsdk" "$target_repo"
fi
. ~/bin/Dev-Path-Configs-Source-Me.bash

cd "$target_repo"
emsdk install latest
emsdk activate latest
