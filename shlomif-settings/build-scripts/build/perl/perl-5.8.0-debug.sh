#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/5.8.0-debug"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g'
