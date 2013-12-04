#!/usr/bin/perl

use strict;
use warnings;

my @d;
foreach my $ver (qw(5.18.1))
{
    foreach my $dir (qw(lib/perl5/site_perl lib/site_perl lib/perl5))
    {
        push @d, "$ENV{HOME}/apps/perl/modules/$dir/$ver"
    }
}

print "export PERL5LIB='" . join(":",@d) . "'\n";