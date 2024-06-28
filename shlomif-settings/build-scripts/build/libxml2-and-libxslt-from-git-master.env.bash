#! /usr/bin/env bash
#
# libxml2-and-libxslt-from-git-master.env.bash
# Copyright (C) 2024 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#


lxmldir=$HOME/apps/xml/libxml2-from-git-master/
pydir="$lxmldir/lib64/python3.12"
lxmlbindir="$lxmldir/bin"
export LD_LIBRARY_PATH="${lxmldir}/lib/:${lxmldir}/lib64/"
export PKG_CONFIG_PATH="$lxmldir/lib/pkgconfig"
export PYTHONPATH="$pydir:$pydir/site-packages/"
export PATH="${lxmlbindir}:${PATH}"
_tweak_xml_cats()
{
    export XML_CATALOG_FILES="$(perl -E 'print $ENV{XML_CATALOG_FILES} =~ s#(?:\s|\A)\K#file://#gmrs')"
}

