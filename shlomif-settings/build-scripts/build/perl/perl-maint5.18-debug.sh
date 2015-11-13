#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix="$HOME"/apps/perl/5.18.x-maint -Doptimize='-g' \
    -Duseithreads -Dusedevel
