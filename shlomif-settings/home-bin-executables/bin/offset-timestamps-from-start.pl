#!/usr/bin/perl

use strict;
use warnings;

my $start;
while (<>)
{
    chomp;
    my ($t, $l) = /\A([^\t]+)\t(.*)\z/
        or die "Wrong format at line <$_> $.";
    $start //= $t;
    printf "%f\t%s\n", ($t-$start), $l;
}
