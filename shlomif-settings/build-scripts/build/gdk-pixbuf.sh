#!/usr/bin/env bash
prefix=/opt/`whoami`/gdkpixbuf
rm -fr "$prefix"/*
# if ! test -e autogen.sh
if true
then
    mkdir -p b
    cd b
    meson setup --prefix "$prefix" ..
    ninja -j4 install
else
    if ! test -e ./configure
    then
        NOCONFIGURE=1 ./autogen.sh
    fi
    ./configure --prefix="$prefix"
    make -j4 install
fi
