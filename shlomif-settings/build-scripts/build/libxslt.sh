#!/usr/bin/env bash
use_autotools=1
if test "${use_autotools}" = "1"
then
    ./configure --prefix=$HOME/apps/xml/libxslt --without-crypto --without-python
else
    cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/xml/libxslt" \
        -DCMAKE_BUILD_TYPE=debug \
        "$@"
fi
