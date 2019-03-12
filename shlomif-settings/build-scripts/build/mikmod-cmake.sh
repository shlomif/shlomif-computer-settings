#!/usr/bin/env bash
CFLAGS="-g" cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/multimedia/mikmod" \
    -DCMAKE_BUILD_TYPE=debug \
    ..
