#!/bin/bash
grep -h '^Date:' * |
    perl -pe 's!^Date: !!' |
    perl -pe 's!^\w\w\w, !!' |
    perl -pe 's{\d{2}:\d{2}:\d{2}.*$}{}' |
    perl -pe 's!^\s+!!' |
    perl -pae '$_=sprintf("%.2d-%s-%s\n", @F)' |
    sort | uniq -c | sort -n

