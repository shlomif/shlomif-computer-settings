#!/usr/bin/env bash
p="/opt/`whoami`/vlc-git-master"
export LUAC="/usr/bin/luac"
export CFLAGS='-g'
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug --disable-schroedinger --enable-debug --disable-opencv
