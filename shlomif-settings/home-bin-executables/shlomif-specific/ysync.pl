#! /usr/bin/env perl
#
# Short description for ysync.pl
#
# Version 0.0.1
# Copyright (C) 2024 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Carp         qw/ confess /;
use Getopt::Long qw/ GetOptions /;
use Path::Tiny   qw/ cwd path tempdir tempfile /;

# use Docker::CLI::Wrapper::Container v0.0.4 ();
STDOUT->autoflush(1);

my $SRCBASE =
    path("/run/media/shlomif/cd407dc5-f6b9-4e60-ab3b-b9d012f899c6/shlomif/");
die if not -d $SRCBASE;
my $DESTBASE = path("/home/shlomif");
die if not -d $DESTBASE;

foreach my $subdir (@ARGV)
{
    my $src = path("$SRCBASE/$subdir");
    if ( -l $src )
    {
        say "Skipping symlink \"$src\".";
    }
    elsif ( -f $src )
    {
        my $dest = path("$DESTBASE/$subdir");
        if ( not -e $dest )
        {
            my $destkid = $dest;
            my $kid     = $src;

            say $kid;
            system( "cp",    "-a", "$kid",            "$destkid" );
            system( "chown", "-R", "shlomif:shlomif", "$destkid" );
        }
    }
    else
    {
        die "invalid src \"$src\"" if not -d $src;
        my $dest = path("$DESTBASE/$subdir");
        $dest->mkdir();
        my @kids = $src->children();
        foreach my $kid (@kids)
        {
            my $bn      = $kid->basename();
            my $destkid = $dest->child($bn);
            if ( not -e $destkid )
            {
                say $kid;
                system( "cp",    "-a", "$kid",            "$destkid" );
                system( "chown", "-R", "shlomif:shlomif", "$destkid" );
            }
        }

    }
}

1;

__END__

=encoding UTF-8

=cut
