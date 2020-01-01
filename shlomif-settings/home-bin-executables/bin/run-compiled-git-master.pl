#! /usr/bin/env perl
#
# Short description for run-compiled-git-master.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
use 5.014;
use strict;
use warnings;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $HOME = $ENV{HOME};

sub _p
{
    my $ret = $HOME . shift();
    return ( "$ret/lib", "$ret/lib64" );
}

$ENV{LD_LIBRARY_PATH} = join ":", sort { $a cmp $b } map { _p($_) } (
    qw%
        apps/gimp-devel
        apps/graphics/babl
        apps/graphics/gegl
        apps/graphics/libmypaint
        %
);
exec( "$HOME/apps/gimp-devel/bin/gimp-2.99", @ARGV );
