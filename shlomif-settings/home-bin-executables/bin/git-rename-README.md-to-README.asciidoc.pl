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

my $obj = __PACKAGE__->new;

sub sh
{
    return $obj->do_system( { cmd => [ qw/ bash -ex -c /, @_, ], }, );
}

my $dir      = cwd();
my $BASENAME = 'README';
my @markdown_fns =
    $dir->children(qr/\A(?:${BASENAME})\.(?:markdown|mkdn|mwdn|md)\z/i);
die if @markdown_fns != 1;
my $target_path = path("${BASENAME}.asciidoc");
my $tmp         = tempfile();
sh(
"markdent-html --dialects GitHub --title 'foo' --file @markdown_fns | pandoc -f html -t asciidoc -o $tmp -"
);
sh("git mv @markdown_fns $target_path");
$tmp->copy($target_path);
sh("git add $target_path");
