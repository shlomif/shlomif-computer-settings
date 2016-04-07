#!/bin/bash
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="/opt/kde4-trunk" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ../kdenetwork
