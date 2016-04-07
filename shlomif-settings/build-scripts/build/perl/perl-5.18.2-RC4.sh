#!/bin/sh
rm -f config.sh Policy.sh
# sh Configure -de -Dprefix="$HOME"/apps/perl/5.18.0 -Dusedevel
sh Configure -de -Dprefix="$HOME"/apps/perl/5.18.2-RC4
