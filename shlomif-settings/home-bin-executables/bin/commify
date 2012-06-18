#!/usr/bin/perl

use strict;
use warnings;

use IO::Handle;

sub commify {
    my ( $sign, $int, $frac ) = ( $_[0] =~ /^([+-]?)(\d*)(.*)/ );
    my $commified = (
        scalar reverse join ',',
        unpack '(A3)*',
        scalar reverse $int
    );
    return $sign . $commified . $frac;
}

sub multi_commify
{
    my $l = shift;

    $l =~ s/(\d+(?:\.\d+)?)/commify($1)/ge;

    return $l
}

STDOUT->autoflush(1);

while (my $l = <ARGV>)
{
    print multi_commify($l);
}
