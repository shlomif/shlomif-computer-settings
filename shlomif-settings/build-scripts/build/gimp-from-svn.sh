#!/usr/bin/env bash
gegl_p="$HOME/apps/graphics/gegl"
export PATH="$gegl_p/bin:$PATH"
export PKG_CONFIG_PATH="$gegl_p/lib/pkgconfig:$HOME/apps/graphics/libmypaint/lib/pkgconfig:$HOME/apps/graphics/babl/lib/pkgconfig:$PKG_CONFIG_PATH"
CFLAGS="-g" \
    ./configure --prefix="$HOME"/apps/gimp-devel --enable-maintainer-mode \
        # --with-jpeg2000

# --enable-gtk-doc \
