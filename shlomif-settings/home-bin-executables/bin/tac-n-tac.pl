#! /usr/bin/env perl
#
# Short description for tac-n-tac.pl
#
# Version 0.0.1
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

my @l = <STDIN>;
my $p = 1 + @l;

foreach my $v (@l)
{
    printf "%10d  %s", ( --$p ), $v;
}
