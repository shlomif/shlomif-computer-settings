#!/usr/bin/perl

use strict;
use warnings;

use IO::All;

my @files = `ls perl-*.rpm`;
chomp(@files);

foreach my $f (@files)
{
    my $bare_fn = ($f =~ s/-([0-9\.-]+).*//mrs);

    my $f_d = $1;

    my $existing = `urpmq --sources $bare_fn 2>/dev/null`;
    chomp($existing);

    $existing =~ s#.*/##ms;

    if (! (my ($exist_d) = $existing =~ m#-([0-9\.-]+)#ms))
    {
        # No package exists.
    }
    else
    {
        if ($f_d ne $exist_d)
        {
            print "$f [$exist_d]\n";
        }
    }
}
