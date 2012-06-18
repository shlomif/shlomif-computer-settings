#!/bin/bash
test ! -e build && mkdir build
cd build
rm -f CMakeCache.txt
cmake -DCMAKE_INSTALL_PREFIX="/opt/kde4-trunk" \
    -DCMAKE_BUILD_TYPE=debugfull \
    -DBUILD_bomber= \
    -DBUILD_bovo= \
    -DBUILD_lskat= \
    -DBUILD_kapman= \
    -DBUILD_katomic= \
    -DBUILD_kbattleship= \
    -DBUILD_kblackbox= \
    -DBUILD_kblocks= \
    -DBUILD_kbounce= \
    -DBUILD_kbreakout= \
    -DBUILD_kdiamond= \
    -DBUILD_kfourinline= \
    -DBUILD_kgoldrunner= \
    -DBUILD_killbots= \
    -DBUILD_kiriki= \
    -DBUILD_kjumpingcube= \
    -DBUILD_klines= \
    -DBUILD_kmahjongg= \
    -DBUILD_kmines= \
    -DBUILD_knetwalk= \
    -DBUILD_kolf= \
    -DBUILD_kollision= \
    -DBUILD_konquest= \
    -DBUILD_kpat=1 \
    -DBUILD_kreversi= \
    -DBUILD_ksame= \
    -DBUILD_kshisen= \
    -DBUILD_ksirk= \
    -DBUILD_kspaceduel= \
    -DBUILD_ksquares= \
    -DBUILD_ksudoku= \
    -DBUILD_palapeli= \
    -DBUILD_ktuberling= \
    -DBUILD_ktron= \
    -DBUILD_kubrick= \
    -DBUILD_granatier= \
    ..
