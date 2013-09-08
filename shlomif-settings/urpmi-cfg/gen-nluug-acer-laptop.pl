#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2", 
    {
        arch => "x86_64",
        mdv_mirror => "http://ftp.nluug.nl/pub/os/Linux/distr/Mandrivalinux",
    },
    "$ENV{HOME}/urpmi.cfg",
);
