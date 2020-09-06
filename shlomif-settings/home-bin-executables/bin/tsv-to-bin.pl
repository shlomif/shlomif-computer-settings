#!/usr/bin/perl -na
use strict;
use warnings;
use autodie;

use vars qw/ $cnt $fmt /;

BEGIN
{
    $cnt = $ENV{NUM_FIELDS} // 2;
    $fmt = "q<" x $cnt;
}
die if @F != $cnt;
print pack( $fmt, @F );
