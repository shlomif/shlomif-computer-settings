#!/usr/bin/perl

use strict;
use warnings;

my $url = q{https://rt.cpan.org/Search/Results.rdf?Query=Queue} .
    q{%20%3D%20'XML-RSS'%20AND%20(%20Status%20%3D%20'new'} .
    q{%20OR%20Status%20%3D%20'open'%20OR%20Status} .
    q{%20%3D%20'stalled'%20)};

my $cmd = shift;
if ($cmd eq "print")
{
    print $url;
}
elsif ($cmd eq "fetch")
{
    system("wget","--no-check-certificate","-O", "hello.rdf", $url);
}
else
{
    die "Unknown command";
}
