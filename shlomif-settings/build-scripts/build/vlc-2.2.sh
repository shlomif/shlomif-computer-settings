#!/bin/bash
p="$HOME/apps/vlc-2.2"
export LUAC="/usr/bin/luac5.1"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug
