#!/bin/bash
# ./autogen.sh --prefix=/usr/local/apps/gimp-1.3.x
# source $HOME/conf/build/Env/gimp-from-cvs.sh
# CFLAGS="-g" LDFLAGS="-L/usr/local/apps/gtk-2.4.x/lib" \
export PKG_CONFIG_PATH="$HOME/apps/graphics/gegl/lib/pkgconfig:$PKG_CONFIG_PATH"
CFLAGS="-g" \
    ./configure --prefix="$HOME"/apps/gimp-devel --enable-maintainer-mode

# --enable-gtk-doc \
