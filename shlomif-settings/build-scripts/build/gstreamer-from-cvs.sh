#!/bin/bash
base="$HOME/apps/sound/gstreamer/from-cvs"
export PKG_CONFIG_PATH="$base/lib/pkgconfig/"
./configure --prefix="$base" --disable-neon || exit 1

