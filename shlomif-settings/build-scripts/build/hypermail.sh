#!/bin/sh
pref="$HOME/apps/hypermail"
htdir="$pref/apache"
./configure --prefix="$pref" --with-gdbm --with-httpddir="$htdir"
