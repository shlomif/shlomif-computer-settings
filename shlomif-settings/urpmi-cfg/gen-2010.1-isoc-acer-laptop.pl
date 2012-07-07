#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2", 
    {
        arch => "x86_64",
        mdv_mirror => "http://mirror.isoc.org.il/pub/mandriva",
        ver => "2010.1",
        with_testing => 0,
    },
    "$ENV{HOME}/urpmi.cfg",
) || die $template->error();
