#!/bin/bash
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="/opt/kde5-trunk" \
    -DCMAKE_BUILD_TYPE=debug \
    "$@"
