#!/usr/bin/perl

use strict;
use warnings;

s#__PACKAGE__->mk_accessors\(qw\(([a-z_A-Z0-9 ]+)\)\);#
    "use Class::XSAccessor accessors => {" . join(" ", map { "'$_' => '$_'," } sort {$a cmp $b} split/ /, $1) . "};"
#egms;
