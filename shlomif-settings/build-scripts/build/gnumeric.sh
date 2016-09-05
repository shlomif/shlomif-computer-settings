#!/bin/bash
export PKG_CONFIG_PATH="$HOME/apps/gnumeric/lib/pkgconfig"
CFLAGS="-g" ./configure --prefix="$HOME/apps/gnumeric" --disable-component
