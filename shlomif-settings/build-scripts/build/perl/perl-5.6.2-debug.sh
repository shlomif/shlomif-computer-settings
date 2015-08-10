#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.6.2-debug"
sh Configure -Doptimize='-ggdb3' -Dusedevel -d -e -Dprefix="$PREFIX"
