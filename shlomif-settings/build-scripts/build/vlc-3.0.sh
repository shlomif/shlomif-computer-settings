#!/usr/bin/env bash
p="/opt/vlc-3.0"
export LUAC="/usr/bin/luac"
export CFLAGS='-g'
export PKG_CONFIG_PATH="$p/lib/pkgconfig"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug

# --disable-schroedinger --disable-bluray --disable-swscale --enable-debug
