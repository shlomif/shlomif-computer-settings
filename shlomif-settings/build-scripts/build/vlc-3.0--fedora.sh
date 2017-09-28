#!/bin/bash
p="/opt/vlc-3.0"
export LUAC="/usr/bin/luac"
export CFLAGS='-g'
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug --disable-schroedinger --enable-debug --disable-opencv
