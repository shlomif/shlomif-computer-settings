#!/usr/bin/env bash
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/gwenview" \
    -DCMAKE_BUILD_TYPE=debug \
    "$1"
