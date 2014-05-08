#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix=$HOME/apps/perl/bleadperl -Doptimize='-O3 -flto -march=native' -Dusedevel
