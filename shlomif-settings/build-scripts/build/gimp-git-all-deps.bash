#!/bin/bash
gegl_p="$HOME/apps/graphics/gegl"
babl_p="$HOME/apps/graphics/babl"
export PATH="$gegl_p/bin:$PATH"
export PKG_CONFIG_PATH="$gegl_p/lib/pkgconfig:$HOME/apps/graphics/libmypaint/lib/pkgconfig:$babl_p/lib/pkgconfig:$PKG_CONFIG_PATH"

babl_git_checkout="/home/shlomif/Download/unpack/graphics/gimp/babl/git/babl"
if ! test -e "$babl_git_checkout" ; then
    mkdir -p "$(dirname "$babl_git_checkout")"
    git clone git://git.gnome.org/babl "$babl_git_checkout"
fi
( cd "$babl_git_checkout" && NOCONFIGURE=1 ./autogen.sh && ./configure --prefix="$babl_p" && make && make check && make install ) || { echo failed ; exit -1 ; }
CFLAGS="-g" \
    ./configure --prefix="$HOME"/apps/gimp-devel --enable-maintainer-mode
