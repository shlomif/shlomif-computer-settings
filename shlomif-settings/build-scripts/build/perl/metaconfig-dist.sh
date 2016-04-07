#!/bin/sh
rm -f config.sh Policy.sh
p="$HOME/apps/perl/bleadperl"
# -flto does not work properly in gcc-4.9.x without -ffat-lto-objects
sh Configure -de -Dprefix="$p" -Doptimize='-O3 -march=native' -Dusedevel -Dscriptdir="$p/bin" -Dorgname='Shlomi Fish'
