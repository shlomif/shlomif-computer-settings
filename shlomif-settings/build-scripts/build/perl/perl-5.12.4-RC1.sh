#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix="$HOME"/apps/perl/5.12.4-RC1 -Dusedevel -Dusethreads
