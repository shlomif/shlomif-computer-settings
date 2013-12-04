#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.8.x-latest"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g'
