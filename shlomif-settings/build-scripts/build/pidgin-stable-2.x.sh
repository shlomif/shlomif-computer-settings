#!/usr/bin/env bash
pref="$HOME/apps/pidgin-2.x"
./configure --prefix="$pref" # --disable-vv --disable-meanwhile --disable-nm --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install
