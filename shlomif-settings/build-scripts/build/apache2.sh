#!/bin/sh
./configure --enable-dav --enable-so --enable-ssl --enable-deflate \
    --prefix=/usr/local/apps/apache2 \
    --with-berkeley-db=/usr/local/apps/db-4.2/ \
    --enable-modules="cache"

