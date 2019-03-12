#!/usr/bin/env bash
k4d="/opt/akregator4.5"
k4sd="$k4d/share"
k4bd="$k4d/bin"
PATH="$k4bd:$PATH"
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
export CMAKE_PREFIX_PATH="$k4d:$CMAKE_PREFIX_PATH"
cmake -DCMAKE_INSTALL_PREFIX="$k4d" \
    -D"PYTHON_SITE_PACKAGES_DIR:PATH"="$k4d/lib" \
    -DCMAKE_BUILD_TYPE=debugfull \
    ..

    # -DKDE4_KDECONFIG_EXECUTABLE="$k4bd/kde4-config" \
    # -DKDE4_DATA_DIR="$k4sd" \
    # -DCMAKE_MODULE_PATH="$k4sd/apps/cmake/modules/" \
