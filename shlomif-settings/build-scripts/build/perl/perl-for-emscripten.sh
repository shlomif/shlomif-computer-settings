#!/bin/sh
rm -f config.sh Policy.sh
# -flto does not work properly in gcc-4.9.x without -ffat-lto-objects
sh Configure -de -Dprefix=/usr -Doptimize='-g' -Dusedevel -Uuse64bitint -Uuse64bitall -Ud_sem -Di_fcntl
