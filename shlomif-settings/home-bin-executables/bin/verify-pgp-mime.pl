#!/usr/bin/perl

use warnings;

use strict;

use PGP::Mail;

sub read_file
{
    my $filename = shift;
    my $contents = "";
    {
        local $/;
        open my $fh, "<$filename";
        $contents = <$fh>;
        close($fh);
    }
    return $contents;
}

my $filename = shift(@ARGV);

my $text = read_file($filename);
my $pgp = 
    PGP::Mail->new(
        $text,
        +{}
    );
print $pgp->status(), "\n";    
print $pgp->keyid(), "\n";

