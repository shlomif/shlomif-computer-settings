#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use 5.014;

use Test::More tests => 3;

{
    my $contents = scalar(`cat shlomif-settings/shell-history/history.bash`);

    # TEST
    is(
        $contents,
        scalar(
            `LC_ALL=C sort -u < shlomif-settings/shell-history/history.bash`),
        "shell-history is sorted and unique"
    );

    # TEST
    unlike( $contents, qr#  #, "double space" );

    # TEST
    unlike( $contents, qr#\t#, "no tabs" );
}
