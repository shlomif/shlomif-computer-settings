#!/bin/bash
./configure --prefix=$HOME/apps/gui/KDE/3.5.2
find . -name Makefile |
    xargs perl -pli -e \
    '$_="kde_widgetdir = \${libdir}/kde3/plugins/designer"
        if /^kde_widgetdir = /'

