#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix=$HOME/apps/perl/perl-5.11.4 -Dusedevel
