#!/bin/bash
p="$HOME/apps/vlc"
./configure --prefix="$p" --with-kde-solid="$p/share/apps/solid" --enable-debug
