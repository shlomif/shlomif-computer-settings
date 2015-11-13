#!/bin/sh
rm -f config.sh Policy.sh
sh Configure -de -Dprefix=$HOME/apps/perl/bleadperl -Dusedevel -Dusethreads
