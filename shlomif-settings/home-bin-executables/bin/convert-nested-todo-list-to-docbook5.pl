#!/usr/bin/perl

use strict;
use warnings;

my $level = 0;
print "<listitem>\n";

sub handle_level
{
    my ($l) = @_;
    if ($level == $l)
    {
        print "</listitem>\n<listitem>\n";
    }
    while( $level > $l)
    {
        $level--;
        print "</listitem>\n</itemizedlist>\n";
    }
    while( $level < $l)
    {
        $level++;
        print "<itemizedlist>\n<listitem>\n";
    }
    return;
}

while (my $line = <>)
{
    chomp($line);
    if (my ($l_s, $delim, $text) =
        $line =~ m#^(\s*)((?:[\*\-] )?)([^\n]*)\n?\z#ms)
    {
        if ($delim)
        {
            handle_level(int ( length($l_s) / 4 ));
        }
        print "<para>\n$text\n</para>\n";
    }
    else
    {
        die "Foo <<$_>>";
    }
}

handle_level(0);
