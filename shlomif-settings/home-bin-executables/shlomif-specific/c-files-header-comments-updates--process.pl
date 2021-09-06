#! /usr/bin/env perl
#
# Short description for process.pl
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

my $text = $_;
$text =~ s#\A((^//[^\n]*\n)+)##ms
    or die $ARGV;
my $comment = $1;
if ( $ARGV !~ m#longlong|portable_time#ms )
{
    $comment =~ s#the COPYING.txt file#the LICENSE file#ms
        or die $ARGV;
    $comment =~ s#in the COPYING file\.$#in the LICENSE file.#ms
        or die $ARGV;

}
$comment = "// SPDX-License-Identifier: MIT\n" . $comment;
$text    = $comment . $text;
$_       = $text;
