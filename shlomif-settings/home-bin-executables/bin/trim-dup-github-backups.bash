#!/usr/bin/env bash
#
# trim-dup-github-backups.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

for i in *.git
do
    d=../../s/shlomif/"$i"
    test -e "$d" && test -z "`diff -u -r "$d" "$i"`" && echo "$i"
done
