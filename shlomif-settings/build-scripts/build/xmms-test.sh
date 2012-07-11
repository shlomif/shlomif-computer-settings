#!/bin/bash
# ./autogen.sh --prefix=/usr/local/apps/gimp-1.3.x
# source $HOME/conf/build/Env/gimp-from-cvs.sh
# CFLAGS="-g" LDFLAGS="-L/usr/local/apps/gtk-2.4.x/lib" \
CFLAGS="-g" \
    ./configure --prefix=$HOME/apps/test/xmms --enable-maintainer-mode
