#!/usr/bin/env bash
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/kmix" \
    -DCMAKE_BUILD_TYPE=debug \
    "$1"
