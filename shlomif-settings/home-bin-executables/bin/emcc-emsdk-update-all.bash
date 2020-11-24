#! /usr/bin/env bash
#
# emcc-emsdk-update-all.bash
# Copyright (C) 2020 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

. ~/bin/Dev-Path-Configs-Source-Me.bash

set -e -x
cd ~/Download/unpack/prog/llvm-to-js/emsdk/
emsdk install latest
emsdk activate latest
