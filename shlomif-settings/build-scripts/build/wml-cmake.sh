#!/usr/bin/env bash
cmake -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX="$HOME/apps/wml-from-source" \
    ../src/
    # -DLIB_INSTALL_DIR="$HOME/apps/wml-from-source/lib" \
