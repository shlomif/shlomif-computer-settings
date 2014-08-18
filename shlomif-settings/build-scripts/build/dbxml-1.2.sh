#!/bin/bash
LIBTSO_LIBS=-lpthread ../dist/configure --prefix=/usr/local/apps/dbxml-1.2 \
    --with-berkeleydb=/usr/local/apps/db-4.2 \
    --with-pathan=/usr  \
    --with-xerces=/usr \
    --enable-tcl --enable-test \
    --with-tcl=/usr/lib

