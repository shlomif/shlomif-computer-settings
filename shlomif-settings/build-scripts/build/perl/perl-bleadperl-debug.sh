#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix="$HOME"/apps/perl/bleadperl-debug -Doptimize='-g3' \
    -Dman1dir=none -Dman3dir=none \
    -Duseithreads -Dusedevel
