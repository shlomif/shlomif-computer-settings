#!/bin/bash
CFLAGS="-g" \
    ./configure --prefix="$HOME"/apps/net/VoIP/ekiga \
    --enable-maintainer-mode
