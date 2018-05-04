#!/usr/bin/perl

use strict;
use warnings;

use IO::Handle;

sub commify
{
    my ( $sign, $int, $frac ) = ( $_[0] =~ /^([+-]?)(\d*)(.*)/ );
    my $commified =
        ( scalar reverse join ',', unpack '(A3)*', scalar reverse $int );
    return $sign . $commified . $frac;
}

sub multi_commify
{
    my $l = shift;

    $l =~ s/(\d+(?:\.\d+)?)/commify($1)/ge;

    return $l;
}

STDOUT->autoflush(1);

my $foo = 0;
while ( my $l = <STDIN> )
{
    if ($foo)
    {
        print multi_commify($l);
        print "--\n";
        $foo = 0;
    }
    elsif ( $l =~ m{\AIteration:.*000\n} )
    {
        $foo = 1;
        print multi_commify($l);
    }
}
