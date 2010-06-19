#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2", 
    {
        arch => "x86_64",
        mdv_mirror => "ftp://mirror.isoc.org.il/mandriva",
        with_testing => 0,
    },
    "$ENV{HOME}/urpmi.cfg",
);
