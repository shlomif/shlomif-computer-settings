#!/usr/bin/perl

use strict;
use warnings;

use Time::HiRes qw(time);

STDOUT->autoflush(1);

while (my $l = <>)
{
    chomp($l);
    printf("%f\t%s\n", time(), $l);
}
