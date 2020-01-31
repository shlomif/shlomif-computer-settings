#!/usr/bin/env bash
if ! test -f 'history.bash'
then
    echo "This program must be run under ~/conf/trunk/shlomif-settings/shell-history/ !" 1>2
    exit -1
fi
cat ~/.histfile | perl -lnE 'use Path::Tiny qw/ path /; BEGIN { %h = (map { $_=>1} path("history.bash")->lines_utf8); } s%^:\s*[0-9]+:[0-9]+;%%; s/[ \t]+$//; say if not exists $h{"$_\n"}' | sus > new.bash
