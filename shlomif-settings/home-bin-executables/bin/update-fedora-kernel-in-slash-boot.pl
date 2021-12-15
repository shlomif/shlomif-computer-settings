#! /usr/bin/env perl
#
# Short description for update-fedora-kernel-in-slash-boot.pl
#
# Version 0.0.1
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

chdir( my $dir = path("/boot") );

foreach my $base ( 'vmlinuz', 'initramfs', )
{
    my ($first) = grep { -l $_ and !-e readlink($_) }
        map { path( $base . "old$_" ) } 1 .. 2;
    die "base=$base" if !defined($first);
    path($base)->rename($first);
    my @targets = sort { $a->[1] cmp $b->[1] } map {
        [ $_, scalar( $_->basename =~ s#([0-9]+)#sprintf('%09d', $1)#egr ) ]
    } grep { -f $_ } $dir->children(qr#\A$base-#);
    my $t = $targets[-1][0];
    symlink( $t, $base );
}
