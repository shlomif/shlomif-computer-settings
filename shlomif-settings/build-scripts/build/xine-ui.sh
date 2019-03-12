#!/usr/bin/env bash
export CFLAGS="-g" PKG_CONFIG_PATH="$HOME/apps/TEMP/xine/lib/pkgconfig"
./configure --prefix="$HOME/apps/TEMP/xine"
