#!/bin/bash
export PKG_CONFIG_PATH=/usr/local/apps/gtk-2.4.x/lib/pkgconfig/
export LD_LIBRARY_PATH=/usr/local/apps/gtk-2.4.x/lib:"$LD_LIBRARY_PATH"
patch -p0 < $HOME/conf/patches/issue-143270-patch.diff
LDFLAGS="-L/usr/local/apps/gtk-2.4.x/lib" ./configure --prefix=/usr/local/apps/gtk-2.4.x/
