#!/usr/bin/env bash
export PKG_CONFIG_PATH="$HOME/apps/graphics/babl/lib/pkgconfig:$PKG_CONFIG_PATH"
./configure --prefix="$HOME/apps/graphics/gegl"
