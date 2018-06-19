#! /usr/bin/env perl
#
# Short description for invoke-strace.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.1
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
# Modified On 2018-06-13 14:15
# Created  2018-06-13 14:15
#
use strict;
use warnings;

my @p =map {chomp;( '-p', $_ )}(`pgrep -U shlomif`);
system("strace -A -o st1.strace -t -f @p -e openat,open,execve # | grep -P 'execve|/dev' | tee -a st.log.strace");
