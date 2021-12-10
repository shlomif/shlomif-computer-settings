#!/usr/bin/env bash
p="/opt/`whoami`/vlc-git-master"
lp="/opt/`whoami`/lua-5.2"
li="INSTALL_TOP=$lp"
lpc="$lp/lib/pkgconfig"
lpcc="$lpc/lua5.2.pc"
export LUAC="$lp/bin/luac"
PKG_CONFIG_PATH+=":$lpc"
export PKG_CONFIG_PATH
export CFLAGS='-g'
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug --disable-schroedinger --enable-debug --disable-opencv --disable-lua
