#!/bin/bash
CFLAGS="-g" cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/multimedia/libmikmod" \
    -DCMAKE_BUILD_TYPE=debug \
    ..
