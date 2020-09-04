#!perl

use 5.014;
use strict;
use warnings;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my ( $cnt, $fmt, $len );

{
    $cnt = $ENV{NUM_FIELDS} // 2;
    $fmt = "q" x $cnt;
    $len = 8 * $cnt;
}
my $buf = '';

if ( !@ARGV )
{
    push @ARGV, { stdin => 1 };
}
foreach my $fn (@ARGV)
{
    my $fh = ref($fn) eq "" ? path($fn)->openr : \*STDIN;
    while ( !eof($fh) )
    {
        die if $fh->read( $buf, $len ) ne $len;
        die if length($buf) ne $len;
        print join( "\t", unpack( $fmt, $buf ) ), "\n";
    }
    close $fh;
}
