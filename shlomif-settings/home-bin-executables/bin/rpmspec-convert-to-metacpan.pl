#!/usr/bin/perl

use strict;
use warnings;

while (<>)
{
    chomp;
    if (/\AUrl\s*:/i)
    {
        s#http://search.cpan.org/dist/#http://metacpan.org/release/#;
    }
    print "$_\n";
}
