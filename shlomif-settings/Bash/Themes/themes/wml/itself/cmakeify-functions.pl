#!/usr/bin/env perl

use strict;
use warnings;

use IO::All;

my $filename = shift || "config.h.cmake";

my @lines = io()->file($filename)->chomp()->slurp();

my ( @new, @funcs );
my ( $i,   $skip );

SEARCH_FOR_FUNCS:
for ( $i = 0, $skip = 1 ; $i < @lines ; $i += $skip, $skip = 1 )
{
    my $l = $lines[$i];
    if ( $l =~
        m{^/\*.*?have the (?:(?:`(\w+)')|(?:(\w+)\(\))) function.*?\*/\s*$} )
    {
        my $func    = $1 || $2;
        my $uc_func = "HAVE_" . uc($func);
        if ( $lines[ $i + 1 ] =~ m{^#undef $uc_func\s*$} )
        {
            push @funcs, $func;
            push @new, $l, "#cmakedefine $uc_func 1";
            $skip = 2;
            next SEARCH_FOR_FUNCS;
        }
    }
    push @new, $l;
}

io()->file( $filename . ".new" )->print( map { "$_\n" } @new );
print map { "$_\n" } @funcs;
