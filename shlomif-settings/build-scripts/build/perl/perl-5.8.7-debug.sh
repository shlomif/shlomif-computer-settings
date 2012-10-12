#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.8.7-debug"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g'
