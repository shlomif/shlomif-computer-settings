#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2", 
    {
        arch => "i586",
        mdv_mirror => "ftp://mirror.isoc.org.il/mandriva",
        with_testing => 1,
    },
    "$ENV{HOME}/urpmi.cfg",
);
