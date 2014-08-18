#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/double-prefix"
sh Configure -de -Dprefix="$PREFIX" -Dvendorprefix="$PREFIX" \
    -Dsiteprefix="$PREFIX" -Dsitebin="$PREFIX/local/bin"

