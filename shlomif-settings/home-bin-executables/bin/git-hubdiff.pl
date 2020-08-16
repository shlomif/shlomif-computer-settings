#! /usr/bin/env perl

use strict;
use warnings;
use autodie;
use 5.016;

#
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

my @remote = `git remote -v`;

#say $remote;
#
my ( $host, $user, $repo ) = (
    map {
m#\Aorigin\s+(?:[^\@]*\@|https?://)(?P<host>[^:/]+)[:/](?P<user>[^/]+)/(?P<repo>[a-zA-Z0-9\-_]+)#
            ? @+{qw/ host user repo /}
            : ()
    } @remote
) or die "no origin remote";

my $orig_b = shift @ARGV;
my $new_b  = shift @ARGV;

my $url = qq#https://${host}/${user}/${repo}/compare/${orig_b}..${new_b}#;

say $url;
use Clipboard;
Clipboard->copy_to_all_selections($url);
