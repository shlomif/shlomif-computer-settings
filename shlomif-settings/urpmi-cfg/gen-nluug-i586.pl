#!/usr/bin/perl

use strict;
use warnings;

use Template;

my $template = Template->new();

$template->process(
    "urpmi.cfg.tt2", 
    {
        arch => "i596",
        mdv_mirror => "ftp://ftp.nluug.nl/pub/os/Linux/distr/Mandrivalinux",
    },
    "$ENV{HOME}/urpmi.cfg",
);
