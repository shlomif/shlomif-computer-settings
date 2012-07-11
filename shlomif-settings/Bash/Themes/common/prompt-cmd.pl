#!/usr/bin/perl

use strict;
use warnings;

my $string = shift;
foreach (@ARGV)
{
    if (/^([^=]+)=(.*)$/)
    {
        my ($v, $s) = ($1,$2);
        if (substr($string, 0, length($s)) eq $s)
        {
            if ((length($string) > length($s)) ?
                (substr($string,length($s), 1) eq "/") :
                1
               )
            {
                print $v . substr($string, length($s));
                exit(0);
            }
        }
    }
    else
    {
        die "Bad";
    }
}
print $string;

