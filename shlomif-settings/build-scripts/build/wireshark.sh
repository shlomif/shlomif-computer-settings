#!/usr/bin/env bash
CFLAGS="-g" ./configure --prefix="$HOME/apps/net/wireshark" \
    --enable-maintainer-mode
