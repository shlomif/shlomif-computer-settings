#!/usr/bin/env bash
p="$HOME/apps/vlc"
export LUAC="/usr/bin/luac5.1"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug
