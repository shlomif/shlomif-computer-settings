#!/usr/bin/env bash
CFLAGS="-g" CXXFLAGS="-g" \
    ./configure --prefix="$HOME/apps/prog/php/quanta" \
        --enable-maintainer-mode
