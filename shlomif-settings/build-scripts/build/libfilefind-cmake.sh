#!/usr/bin/env bash
(
    set -e -x
    rm -fr ../build
    mkdir -p ../build
    cd ../build
    cmake ../c_glib_based
    make
    make test
)
