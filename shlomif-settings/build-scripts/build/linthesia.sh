#!/bin/sh
pref="$HOME/apps/to-del-linthesia"
PKG_CONFIG_PATH="$pref/lib/pkgconfig" ./configure --prefix="$pref"
