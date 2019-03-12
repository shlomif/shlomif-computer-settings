#!/usr/bin/env bash
CFLAGS="-g" CXXFLAGS="-g" \
    ./configure --prefix="$HOME/apps/gui/kde/kdebase-3.5.x" \
        --enable-maintainer-mode
