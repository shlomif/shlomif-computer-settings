#!/bin/bash
cd "$HOME"/progs/perl/www/RSS/blogs-aggregate/trunk/blogs-aggregate \
    && perl collect-shlomif-feeds.pl "$@"
