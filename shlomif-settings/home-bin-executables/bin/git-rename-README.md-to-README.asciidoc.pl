#! /usr/bin/env perl
#
# Short description for git-rename-README.md-to-README.asciidoc.pl
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

use Moo;
extends('Docker::CLI::Wrapper::Base');

my $o = __PACKAGE__->new;

sub sh
{
    return $o->do_system( { cmd => [ qw/ bash -ex -c /, @_, ], }, );
}

my $d   = cwd();
my @mds = $d->children(qr/\Areadme\.(?:markdown|mkdn|mwdn|md)\z/i);
die if @mds != 1;
my $ad  = path("README.asciidoc");
my $tmp = tempfile;
sh(
"markdent-html --dialects GitHub --title 'foo' --file @mds | pandoc -f html -t asciidoc -o $tmp -"
);
sh("git mv @mds $ad");
$tmp->copy($ad);
sh("git add $ad");
