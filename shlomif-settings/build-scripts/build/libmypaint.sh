#!/usr/bin/env bash
gegl_p="$HOME/apps/graphics/gegl"
export PATH="$gegl_p/bin:$PATH"
export PKG_CONFIG_PATH="$gegl_p/lib/pkgconfig:$HOME/apps/graphics/babl/lib/pkgconfig:$PKG_CONFIG_PATH"

./configure --prefix="$HOME/apps/graphics/libmypaint"
# for args in '' 'install' ; do
    # scons prefix=$HOME/apps/graphics/libmypaint $args
# done

# --enable-gtk-doc \
