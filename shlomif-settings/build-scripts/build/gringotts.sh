#!/bin/bash
LIBGRG_CFLAGS="-I $HOME/apps/file/libgringotts/include" \
    LIBGRG_LIBS="-L $HOME/apps/file/libgringotts/lib -lgringotts" \
    CFLAGS="-g" ./configure --prefix=$HOME/apps/file/gringotts
