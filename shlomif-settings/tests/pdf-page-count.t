#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

{
    # TEST
    like(
        scalar(
`$^X shlomif-settings/home-bin-executables/bin/pdf-page-count.pl shlomif-settings/tests/data/Muppets-Show--Harry-Potter.pdf`
        ),
        qr#\t5\n\z#ms,
        "commify is working"
    );
}
