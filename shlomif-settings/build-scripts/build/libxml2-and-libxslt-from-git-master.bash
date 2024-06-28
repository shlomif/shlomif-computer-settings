#! /usr/bin/env bash
#
# libxml2-and-libxslt-from-git-master.bash
# Copyright (C) 2024 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

set -e -x
. "$HOME/conf/build/libxml2-and-libxslt-from-git-master.env.bash"
rm -fr "${lxmldir}"
cd ~/Download/unpack/xml/libxml2
git clean -dxf
ver="master"
git co "${ver}"
git s o
NOCONFIGURE=1 ./autogen.sh
bash -x ~/conf/build/libxml2-from-git-master.sh
make
make check
make install
cd ~/Download/unpack/xml/libxslt/libxslt/
git clean -dxf
xslt_ver="master"
git co "${xslt_ver}"
git s o
NOCONFIGURE=1 ./autogen.sh
bash -x ~/conf/build/libxml2-from-git-master.sh
make
make check
make install
