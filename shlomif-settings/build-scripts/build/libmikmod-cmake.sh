#!/usr/bin/env bash
CFLAGS="-g" cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/multimedia/libmikmod" \
    -DENABLE_ALSA=1 -DENABLE_OSS=1 -DCMAKE_BUILD_TYPE=debug \
    ..
