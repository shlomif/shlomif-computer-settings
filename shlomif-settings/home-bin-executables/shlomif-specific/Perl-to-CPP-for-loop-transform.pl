#!/usr/bin/perl

use strict;
use warnings;

s#\A( *)for (?:ll|my) (\w+) \((.*?) \.\. (.*?)\)\z#
    $1 . "for (ll $2 = $3 ; $2 <= $4 ; $2++)"
    #e;
