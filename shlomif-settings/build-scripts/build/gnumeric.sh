#!/bin/bash
export PKG_CONFIG_PATH="$HOME/apps/gnumeric/lib/pkgconfig"
./configure --prefix="$HOME/apps/gnumeric" --disable-component
