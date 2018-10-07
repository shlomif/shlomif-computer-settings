#!/usr/bin/env perl

use strict;
use warnings;
use Path::Tiny qw/ path /;
use File::Update qw/ modify_on_change /;

foreach my $fn (@ARGV)
{
    modify_on_change(
        path($fn),
        sub {
            my $text = shift;
            return $$text =~ s{\A#!/usr/bin/perl}{#!/usr/bin/env perl};
        }
    );
}
