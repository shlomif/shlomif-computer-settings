#!/bin/sh
rm -f config.sh Policy.sh
PREFIX="$HOME/apps/perl/perl-5.10.1-ithr"
sh Configure -de -Dprefix="$PREFIX" -Doptimize='-g' -Duseithreads \
    -Accflags="-DPERL_USE_SAFE_PUTENV"
