#!/bin/bash
p="$HOME/apps/vlc-3.0"
export LUAC="/usr/bin/luac5.2"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug
