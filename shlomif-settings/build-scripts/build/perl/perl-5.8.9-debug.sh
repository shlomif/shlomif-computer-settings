#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.8.9-debug"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g'
