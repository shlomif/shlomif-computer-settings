#!/bin/sh
export PKG_CONFIG_PATH=/usr/local/apps/gimp-1.3.x/lib/pkgconfig/
./configure --enable-build \
    --prefix=/usr/local/apps/gimp-1.3.x/          \
    --with-gimp-prefix=/usr/local/apps/gimp-1.3.x/        \
    --with-xsl=/usr/share/sgml/docbook/xsl-stylesheets

