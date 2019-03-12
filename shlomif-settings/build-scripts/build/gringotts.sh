#!/usr/bin/env bash
CFLAGS="-g" PKG_CONFIG_PATH="$HOME/apps/file/libgringotts/lib/pkgconfig/" \
    ./configure --prefix=$HOME/apps/file/gringotts
