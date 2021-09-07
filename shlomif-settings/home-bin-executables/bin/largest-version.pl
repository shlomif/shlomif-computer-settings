#! /usr/bin/env perl
#
# Short description for largest-version.pl
#
# Version 0.0.1
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use File::Spec;
use Getopt::Long qw/ GetOptions /;

my $dir;
my $basename;
GetOptions( 'basename=s' => \$basename, 'dir=s' => \$dir, )
    or die("Error in command line arguments. $!");
die if ( !defined $dir );
die if ( !defined $basename );

my @vers;
opendir( ( my $dh ), $dir );
foreach my $bn ( File::Spec->no_upwards( readdir $dh ) )
{
    # print "bn=$bn basename=$basename\n";
    if ( my @digits =
        ( $bn =~ m#\A\Q$basename\E([0-9]+)\.([0-9]+)\.([0-9]+)\z#ms ) )
    {
        push @vers, [@digits];
    }
}
closedir $dh;
if ( not @vers )
{
    die "versions not found";
}

sub _sorter
{
    my ( $i, $x, $y ) = @_;
    return ( ( $x->[$i] <=> $y->[$i] ) or _sorter( $i + 1, $x, $y ) );
}
@vers = sort { _sorter( 0, $a, $b ) } @vers;
print join( ".", @{ $vers[-1] } );
