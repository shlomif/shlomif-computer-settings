#!/bin/bash
cmake -G Ninja -DCMAKE_INSTALL_PREFIX="$HOME/apps/graphics/inkscape-trunk" -DENABLE_LCMS=OFF -DCMAKE_CXX_FLAGS="-fpermissive" -DENABLE_POPPLER=OFF -DENABLE_POPPLER_CAIRO=OFF ../inkscape/
