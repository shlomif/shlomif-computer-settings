#!/usr/bin/env bash
cmake -DCMAKE_BUILD_TYPE="debug" -DCMAKE_INSTALL_PREFIX="$HOME/apps/llvm" "$@"
