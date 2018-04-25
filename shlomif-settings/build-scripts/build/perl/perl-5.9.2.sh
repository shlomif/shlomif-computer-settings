#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix=$HOME/apps/perl/perl-5.9.2 -Dusedevel
