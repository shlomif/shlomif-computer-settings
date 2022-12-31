#! /bin/sh
#
# mold-linker.sh
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

set -e -x
p="$HOME/apps/mold-linker"
b="build"
s="`pwd`"
mkdir -p "$b"
cd "$b"
if false
then
    "$s"/install-build-deps.sh
fi
cmake -DCMAKE_INSTALL_PREFIX="$p" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ "$s"
make install
