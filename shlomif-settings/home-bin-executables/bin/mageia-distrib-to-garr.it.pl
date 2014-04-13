#!/usr/bin/perl

use strict;
use warnings;

s{(\s)http.*?/distrib/}{${1}http://mageia.mirror.garr.it/mirrors/mageia/distrib/}g
