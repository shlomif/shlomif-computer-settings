#!/usr/bin/env bash
CFLAGS="-g" ./configure --prefix=$HOME/apps/multimedia/libmikmod \
     --enable-alsa --enable-oss --enable-maintainer-mode
