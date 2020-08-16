#!/usr/bin/env bash
#
# merge-prereqs-yml.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#
locate --regex '/bin/required-modules.yml$' |
    grep -vP progs/freecell/git/prod-fcs |
    grep -vP progs/freecell/git/todel |
    grep -vP Backup |
    xargs cat |
    sort |
    uniq -c |
    sort -n
