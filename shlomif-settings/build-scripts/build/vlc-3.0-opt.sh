#!/bin/bash
p="/opt/vlc-3.0"
export LUAC="${LUAC:-/usr/bin/luac5.2}"
export CFLAGS="${CFLAGS:--O3 -march=native}"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug --disable-opencv

# --disable-schroedinger --disable-bluray --disable-swscale --enable-debug
