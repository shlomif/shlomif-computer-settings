#!/bin/bash
pref="$HOME/apps/pidgin-beta"
# ./configure --prefix="$pref" --disable-vv --disable-meanwhile --disable-nm --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install
./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install
