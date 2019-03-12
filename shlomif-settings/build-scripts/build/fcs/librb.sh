#!/usr/bin/env bash
# Compile Freecell Solver against libredblack
cmake -DCMAKE_BUILD_TYPE=release \
    -DFCS_STATE_STORAGE="FCS_STATE_STORAGE_LIBREDBLACK_TREE" \
    -DFCS_STACK_STORAGE="FCS_STACK_STORAGE_LIBREDBLACK_TREE" \
    -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=/usr/share
