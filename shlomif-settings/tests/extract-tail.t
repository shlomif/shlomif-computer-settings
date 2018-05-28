#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 1;

{
    # TEST
    is(
        scalar(
`shlomif-settings/home-bin-executables/bin/tail-extract '^([0-9]+) =' shlomif-settings/tests/data/extract-tail-1.log`
        ),
        "314789\n",
        "tail-extract is working"
    );
}
