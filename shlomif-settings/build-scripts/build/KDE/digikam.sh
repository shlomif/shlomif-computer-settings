#!/bin/bash
cmake -DCMAKE_MODULE_PATH=/usr/share/apps/cmake/modules/ \
    -DCMAKE_INSTALL_PREFIX="/opt/kde4-trunk" \
    -DCMAKE_BUILD_TYPE=debugfull ..
