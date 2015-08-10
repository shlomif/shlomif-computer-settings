#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2",
    {
        arch => "i586",
        mdv_mirror => "http://mirror.isoc.org.il/pub/mandriva",
        with_testing => 0,
    },
    "$ENV{HOME}/urpmi.cfg",
);
