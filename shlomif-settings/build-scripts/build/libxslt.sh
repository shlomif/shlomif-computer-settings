#!/usr/bin/env bash
use_autotools=1
d="$HOME/apps/xml/libxml2"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:${d}"
if test "${use_autotools}" = "1"
then
    ./configure --prefix="${d}" --without-crypto --without-python
else
    cmake -DCMAKE_INSTALL_PREFIX="${d}" \
        -DCMAKE_BUILD_TYPE=debug \
        "$@"
fi
