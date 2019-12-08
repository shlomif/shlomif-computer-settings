#! /bin/bash
#
# regen-all-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
set -e -x
p="$(pwd)"
find . -name '.git' -type d | ( LC_ALL=C sort ) | xargs dirname | \
    (while read mydir
do
    if cd "$mydir" && git s o
    then
        cd "$p"
    else
        exit 1
    fi
done)
