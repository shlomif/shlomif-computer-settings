#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.8.8-debug"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g'
