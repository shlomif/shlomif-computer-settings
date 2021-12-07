#! /bin/sh
#
# lua-5.2.x.sh
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

unset MAKEFLAGS
lp="/opt/`whoami`/lua-5.2"
li="INSTALL_TOP=$lp"
lpc="$lp/lib/pkgconfig"
lpcc="$lpc/lua5.2.pc"
make linux install $li
mkdir -p "$lpc"
make pc $li > "$lpcc"
