#!/bin/bash
prefix="$HOME/apps/gtk-2.16.x"
export PKG_CONFIG_PATH=$prefix/lib/pkgconfig/
export LD_LIBRARY_PATH=$prefix/lib:"$LD_LIBRARY_PATH"
# patch -p0 < $HOME/conf/patches/issue-143270-patch.diff
LDFLAGS="-L$prefix/lib" ./configure --prefix="$prefix"
