#!/usr/bin/env perl

use strict;
use warnings;

unlink( "config.sh", "Policy.sh" );

system(
    "sh",         "Configure",
    "-de",        "-Dprefix=$ENV{HOME}/apps/perl/emcc",
    "-Dusedevel", "-Dcc=emcc",
    "-D_o=.bc",   q#-Doptimize=-O2 -m32 -std=gnu99#,
);
