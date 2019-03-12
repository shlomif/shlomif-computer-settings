#!/usr/bin/env bash
basedir=/usr/local/apps/gtk-2.4.x
basedir=$HOME/apps/gtk-2.4.x
export PKG_CONFIG_PATH="$basedir"/lib/pkgconfig/
export LD_LIBRARY_PATH="$basedir"/lib:"$LD_LIBRARY_PATH"
LDFLAGS="-L$basedir/lib" \
    ./configure --prefix=$basedir \
    --with-svgz=no
