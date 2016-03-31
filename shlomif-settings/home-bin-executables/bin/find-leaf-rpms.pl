#!/usr/bin/perl

use strict;
use warnings;

my %installed = (map { chomp; $_ => 1 } `rpm -qa --qf "%{n}\\n"`);

foreach my $rpm (sort keys %installed)
{
    my @deps = `urpmq --whatrequires "$rpm"`;
    chomp @deps;
    my %l = ($rpm => 1);
    my @found= sort grep { exists $installed{$_} and !$l{$_}++} @deps;
    print "$rpm\t" . scalar(@found) . "\t" . join(',', @found) . "\n";
}
