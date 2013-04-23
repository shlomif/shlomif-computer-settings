#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long qw(GetOptions);

my $auth = 1;

my $bb_user;
my $bb_repo;

GetOptions(
    'user=s' => \$bb_user,
    'repo=s' => \$bb_repo,
);

if (!defined ($bb_user))
{
    die "user not specified!";
}

if (!defined ($bb_repo))
{
    die "repo not specified!";
}

if (($ENV{BITBUCKET_USERS} || '') =~ m{,\Q$bb_user\E,})
{
    print "ssh://hg\@bitbucket.org/$bb_user/$bb_repo\n";
}
else
{
    print "https://bitbucket.org/$bb_user/$bb_repo\n";
}
