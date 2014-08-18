#!/usr/bin/perl

use strict;
use warnings;

while(my $l = <>)
{
    chomp($l);
    if ($l =~ /\A([^=]+)=(.*)/)
    {
        print "export $1='" . ($2 =~ s/'/'\\''/gr) . "'\n";
    }
    else
    {
        die "Line $l sucks.";
    }
}
