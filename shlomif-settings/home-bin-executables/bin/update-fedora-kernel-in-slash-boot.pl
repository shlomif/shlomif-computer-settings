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

STDOUT->autoflush(1);

chdir( my $dir = path("/boot") );

my @actions;
foreach my $base ( 'vmlinuz', 'initramfs', )
{
    my @options = grep { -l $_ }
        ( path($base), ( map { path( $base . ".old$_" ) } 1 .. 5 ) );
    my (@valid) = grep { -e readlink($_) } @options;
    print "valid = @valid\n";
    if ( not @valid )
    {
        die "no link found at base=$base";
    }

    # path($base)->move($first);
    my @targets = sort { $a->[1] cmp $b->[1] } map {
        [ $_, scalar( $_->basename =~ s#([0-9]+)#sprintf('%09d', $1)#egr ) ]
    } grep { -f $_ } $dir->children(qr#\A$base-#);
    my $t = $targets[-1][0];
    push @actions, { 'base' => $base, 'target' => scalar( $t->basename() ), };
}

foreach my $rec (@actions)
{
    # body...
    print "ln -sf $rec->{target} $rec->{base}\n";
}
print("\nIs it ok?\n");
my $line = <>;
chomp($line);

if ( $line eq 'y' )
{
    foreach my $rec (@actions)
    {
        symlink( $rec->{target}, $rec->{base} );
    }
}
