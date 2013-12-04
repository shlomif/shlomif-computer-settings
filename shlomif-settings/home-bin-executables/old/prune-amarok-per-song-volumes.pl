#!/usr/bin/perl

use strict;
use warnings;

use DBI;
use File::Spec;

my $data_dir =
    File::Spec->catdir(
        $ENV{HOME}, ".kde", "share", "apps" ,"amarok", "scripts-data",
    );

my $db_file = File::Spec->catfile($data_dir, "per-song-volume.sqlite");

my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file", "", "");

my $paths_sth = $dbh->prepare("SELECT path FROM songs_volumes");
my $del_sth = $dbh->prepare("DELETE FROM songs_volumes WHERE path = ?");

$paths_sth->execute();

my @to_remove;

while (my ($path) = $paths_sth->fetchrow_array())
{
    # Remove if does not exist.
    if (! -f $path)
    {
        push @to_remove, $path;
    }
}

foreach my $path (@to_remove)
{
    $del_sth->execute($path);
}

