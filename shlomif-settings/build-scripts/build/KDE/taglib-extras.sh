#!/bin/bash
cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/multimedia/amarok-svn" \
    -DCMAKE_BUILD_TYPE=debugfull \
    .
