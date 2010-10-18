#!/bin/bash
# ./autogen.sh --prefix=/usr/local/apps/gimp-1.3.x
export PKG_CONFIG_PATH=/usr/local/apps/gtk-2.4.x/lib/pkgconfig/
export LD_LIBRARY_PATH=/usr/local/apps/gtk-2.4.x/lib:"$LD_LIBRARY_PATH"
