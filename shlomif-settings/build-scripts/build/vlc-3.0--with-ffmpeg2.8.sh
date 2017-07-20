#!/bin/bash
p="/opt/vlc-3.0"
export LUAC="/usr/bin/luac5.2"
export CFLAGS='-g'
export PKG_CONFIG_PATH="$HOME/apps/multimedia/ffmpeg-2.8.x/lib/pkgconfig"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug --disable-schroedinger --disable-bluray --disable-swscale --enable-debug
