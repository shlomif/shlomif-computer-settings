#!/bin/bash
CFLAGS="-g" \
./configure --prefix=/home/shlomi/apps/net/www/swfdec \
    --disable-static --enable-gtk-doc --enable-vivified
