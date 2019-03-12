#!/usr/bin/env bash
p="/opt/vlc-2.2"
export LUAC="/usr/bin/luac5.2"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug
