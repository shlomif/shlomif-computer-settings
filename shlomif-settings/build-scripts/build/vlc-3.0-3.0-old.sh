#!/bin/bash
p="/opt/vlc-3.0/__vlc-3.0"
export LUAC="/usr/bin/luac5.2"
export CFLAGS='-g'
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug \
--disable-schroedinger --disable-bluray --disable-swscale --enable-debug
