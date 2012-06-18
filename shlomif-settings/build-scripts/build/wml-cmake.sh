#!/bin/bash
cmake -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX="$HOME/apps/test/wml" \
    -DLIB_INSTALL_DIR="$HOME/apps/test/wml/lib" \
    ..
