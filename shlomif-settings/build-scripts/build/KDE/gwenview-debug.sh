#!/bin/bash
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/gwenview" \
    -DCMAKE_BUILD_TYPE=debugfull \
    "$1"
