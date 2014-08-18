#!/usr/bin/perl

use strict;
use warnings;

use Net::Telnet;
use File::Spec::Functions;

my $filename;

if ($ARGV[0] eq "-f")
{
    $filename = $ARGV[1];
}

my $full_path;
if (!defined($filename))
{
    my $url = shift(@ARGV);

    $url =~ m{([^/]+)$};
    $filename = $1;

    $full_path = $ENV{'HOME'}."/Download/Video/Torrents/".$filename; 
    unlink($full_path);
    system("wget", "-O", $full_path, $url);
}
else
{
    $full_path = File::Spec::Functions::rel2abs($filename);
}

my $donkey = Net::Telnet->new();
$donkey->open(Host => "localhost", Port => 4000);

$donkey->print("dllink $full_path");

$donkey->waitfor("/\\n/");

$donkey->print("q");

$donkey->waitfor("/\\n/");

$donkey->close();

