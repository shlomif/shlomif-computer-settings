#!/usr/bin/env bash
#
# ctags_all_langs.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

__myctags()
{
    (
        cd "$this"
        ctags -f tags --recurse --totals \
            --exclude='**/blib/**' --exclude='**/t/lib/**' \
            --exclude='**/.svn/**' --exclude='*~' \
            --exclude='**/.git/**'
    )
}
