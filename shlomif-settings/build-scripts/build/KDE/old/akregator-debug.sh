#!/usr/bin/env bash
CFLAGS="-g" CXXFLAGS="-g" ./configure \
    --prefix=$HOME/apps/gui/KDE/akregator-debug

hello()
{
find . -name Makefile |
    xargs perl -pli -e \
    '$_="kde_widgetdir = \${libdir}/kde3/plugins/designer"
        if /^kde_widgetdir = /'
}
