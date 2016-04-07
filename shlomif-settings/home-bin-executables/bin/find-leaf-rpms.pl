#!/usr/bin/perl

use strict;
use warnings;
use autodie;
my %installed = (map { chomp; $_ => +{} } `rpm -qa --qf "%{n}\\n" | grep -vP '^(task-shlomif|msttcorefonts)\$'`);

my @installed_rpms = sort keys %installed;
open my $in_fh, qq#urpmq --debug --whatrequires @installed_rpms 2>&1 |#;
while (my $l = <$in_fh>)
{
    if (my ($requires, $what_req) = ($l =~ /\Aadding package (\S+) \(requires ([^\) ]+)/))
    {
        if (exists $installed{$requires} and exists $installed{$what_req})
        {
            $installed{$what_req}{$requires} = 1;
        }
    }
}
foreach my $rpm (@installed_rpms)
{
    my @found = grep { $_ ne $rpm } sort keys %{$installed{$rpm}};
    print "$rpm\t" . scalar(@found) . "\t" . join(',', @found) . "\n";
}
