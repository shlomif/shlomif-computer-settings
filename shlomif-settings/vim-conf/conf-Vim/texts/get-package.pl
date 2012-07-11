#!/usr/bin/perl

use strict;
use warnings;

use File::Spec;
use Cwd qw(getcwd);

my $fn = shift(@ARGV);
$fn = File::Spec->rel2abs($fn);

$fn =~ s{\.pm\z}{};

my $cwd = getcwd();

my $package;

if ($fn =~ m{/lib/(.*)\z}ms)
{
    $package = $1;
}
elsif ($fn =~ m{\A\Q$cwd\E/(.*)\z}ms)
{
    $package = $1;
}
else
{
    die "Cannot handle case of filename not under lib/ or below \$CWD!";
}

$package =~ s{/}{::}g;

print "package $package;\n";
