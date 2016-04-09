#!/bin/bash
b='/opt/llvm'
export PATH="$b/bin:$PATH"
export PKG_CONFIG_PATH="$b/lib64/pkgconfig:$b/lib/pkgconfig:$PKG_CONFIG_PATH"
cmake -DCMAKE_BUILD_TYPE="release" -DCMAKE_INSTALL_PREFIX="$b" "$@"
