#! /bin/sh
#
# mold-linker.sh
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

set -e -x
p="$HOME/apps/mold-linker"
make PREFIX="$p" install
