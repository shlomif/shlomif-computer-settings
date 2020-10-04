#! /usr/bin/env perl
#
# Short description for fix-kdeglobals.pl
#
# Version 0.0.1
# Copyright (C) 2020 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

# See https://bugs.mageia.org/show_bug.cgi?id=27291

path("$ENV{HOME}/.config/kdeglobals")->edit_utf8(
    sub {
        my $KEY = "AllowKDEAppsToRememberWindowPositions";
        s#^(\[General\].*?)(^\[|\z)#
    my ($sect, $suffix )=($1, $2);
    if ($sect !~ s/^(\Q$KEY\E=)[^\n]*/${1}false/)
    {
        $sect =~ s/\K\n*\z/\n$KEY=false\n/ms;
    }
    $sect =~ s/\n*\z/\n\n/ms;
    $sect.$suffix
    #ems;
    }
);
