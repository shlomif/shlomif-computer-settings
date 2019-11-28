#! /usr/bin/env perl
#
# Short description for adoc.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

s#^.*?alt="([^"]+)".*?src="([^"]+)".*$#image::${2}[$1]#
