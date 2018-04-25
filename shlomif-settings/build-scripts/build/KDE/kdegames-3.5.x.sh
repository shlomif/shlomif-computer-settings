#!/bin/bash
CFLAGS="-g" CXXFLAGS="-g" \
    ./configure --prefix="$HOME/apps/gui/kde/kdegames-3.5.x" \
        --enable-maintainer-mode
