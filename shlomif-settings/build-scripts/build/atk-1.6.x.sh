#!/usr/bin/env bash
export PKG_CONFIG_PATH=/usr/local/apps/gtk-2.4.x/lib/pkgconfig/
export LD_LIBRARY_PATH=/usr/local/apps/gtk-2.4.x/lib:"$LD_LIBRARY_PATH"
LDFLAGS="-L/usr/local/apps/gtk-2.4.x/lib" ./configure --prefix=/usr/local/apps/gtk-2.4.x/
