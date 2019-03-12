#!/usr/bin/env bash
rm -f CMakeCache.txt
# export CXXFLAGS="-DQT_NO_DEBUG_OUTPUT"
cmake -DCMAKE_INSTALL_PREFIX="/opt/kde5-trunk" \
    -DCMAKE_BUILD_TYPE=Release \
    "$@"
    # -DCMAKE_BUILD_TYPE=debug \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
