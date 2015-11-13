#!/usr/bin/perl

use strict;
use warnings;

use DBI;

my $dbh =
    DBI->connect("dbi:Pg:dbname=homedirsize", "", "", {AutoCommit => 1});

$dbh->do("CREATE TABLE entries (id integer, parent integer, name text, mysize integer, totalsize integer)");

$dbh->do("CREATE INDEX entries_id_index ON entries (id)");
$dbh->do("CREATE INDEX entries_parent_index ON entries (parent)");
$dbh->do("CREATE SEQUENCE entries_id_seq");
my $get_seq_sth = $dbh->prepare("SELECT nextval('entries_id_seq')");
my $insert_entry_sth = $dbh->prepare("INSERT INTO entries (id, parent, name, mysize, totalsize) VALUES (?, ?, ?, ?, ?)");

my (@components_stack);
open I, "<", "home-dir-backup.txt";
my $line_num = 0;
while(my $line = <I>)
{
    chomp($line);
    $line_num++;
    if ($line_num % 1000 == 0)
    {
        print STDERR "Processed $line_num Lines\n";
    }
    $line =~ m{^([^ ]+)\s+[^ ]+/[^ ]+\s+(\d+)\s+[^ ]+\s+[^ ]+\s+home/shlomi(.*)$};
    my ($flags, $mysize, $path) = ($1, $2, $3);
    # Skip if a symlink or a hard link
    next if $flags =~ /^[lh]/;
    my $is_dir = $flags =~ /^d/;
    my @comps;
    if ($path eq "/")
    {
        @comps = ("");
    }
    else
    {
        @comps = (split /\//, $path);
    }
    while (@comps != @components_stack+1)
    {
        my $rec = pop(@components_stack);
        $insert_entry_sth->execute(
            $rec->{id},
            $components_stack[-1]->{id},
            $rec->{name},
            $rec->{mysize},
            $rec->{totalsize},
            );
    }
    if ($is_dir)
    {
        $get_seq_sth->execute();
        my ($id) = $get_seq_sth->fetchrow_array();
        push @components_stack, { 'name' => $comps[-1], 'mysize' => 0, 'totalsize' => 0, 'id' => $id,};
    }
    else
    {
        foreach my $item (@components_stack)
        {
            $item->{'totalsize'} += $mysize;
        }
        $get_seq_sth->execute();
        my ($id) = $get_seq_sth->fetchrow_array();
        # Insert into the database.
        $insert_entry_sth->execute(
            $id,
            $components_stack[-1]->{'id'},
            $comps[-1],
            $mysize,
            $mysize
        );
    }
}

while (@components_stack)
{
    my $rec = pop(@components_stack);
    $insert_entry_sth->execute(
        $rec->{id},
        ($components_stack[-1] || {'id' => 0})->{id},
        $rec->{name},
        $rec->{mysize},
        $rec->{totalsize},
   );
}

close(I);

