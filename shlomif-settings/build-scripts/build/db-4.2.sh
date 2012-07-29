#!/bin/bash
../dist/configure --prefix=/usr/local/apps/db-4.2 \
    --enable-cxx --enable-java --enable-tcl \
    --with-tcl=/usr/lib
