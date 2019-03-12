#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

cd "$HOME"/progs/perl/www/RSS/blogs-aggregate/trunk/blogs-aggregate \
    && perl collect-shlomif-feeds.pl "$@"
