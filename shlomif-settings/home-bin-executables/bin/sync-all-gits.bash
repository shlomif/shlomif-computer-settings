#!/usr/bin/env bash
#
# regen-all-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#
set -e -x
p="$(pwd)"
find . -name '.git' -type d | ( LC_ALL=C sort ) | xargs dirname | grep -vE '/(bower_components|node_modules)$' | \
    (while read mydir
do
    if cd "$mydir" && git s o
    then
        cd "$p"
    else
        exit 1
    fi
done)
