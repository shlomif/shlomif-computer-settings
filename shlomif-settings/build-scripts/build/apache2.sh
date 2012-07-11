#!/bin/sh
./configure --enable-dav --enable-so --enable-ssl --enable-deflate \
    --prefix=/opt/apache2-shlomif \
    --with-berkeley-db=/usr \
    --enable-modules="cache"
