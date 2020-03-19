#!/usr/bin/env bash
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/kde/plasma-workspace" \
    -DCMAKE_BUILD_TYPE=debug \
    "$@"
