#!/usr/bin/env bash
REVEL_PREFIX="$HOME/apps/multimedia/video/revel"
CFLAGS="-I /usr/include/SDL -DUSE_CONSOLE -I $REVEL_PREFIX/include" \
    ./configure --prefix=/home/shlomi/apps/multimedia/video/kafka \
        --with-revel-prefix="$REVEL_PREFIX"
