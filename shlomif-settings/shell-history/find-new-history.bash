#!/usr/bin/env bash
cat ~/.histfile | perl -lnE 'use Path::Tiny qw/ path /; BEGIN { %h = (map { $_=>1} path("history.bash")->lines_utf8); } s%^:\s*[0-9]+:[0-9]+;%%; s/ {2,}/ /; s/[ \t]+$//; say if ((not exists $h{"$_\n"}) and /\S/)' | sus > new.bash
