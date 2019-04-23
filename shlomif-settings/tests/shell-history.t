#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

{
    # TEST
    is(
        scalar(`cat shlomif-settings/shell-history/history.bash`),
        scalar(
            `LC_ALL=C sort -u < shlomif-settings/shell-history/history.bash`),
        "shell-history is sorted and unique"
    );
}
