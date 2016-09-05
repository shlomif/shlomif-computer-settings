#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long qw(GetOptions);

my $auth = 1;

my $gh_user;
my $gh_repo;

GetOptions(
    'user=s' => \$gh_user,
    'repo=s' => \$gh_repo,
) or die "GetOptions failed! $!";

if (!defined ($gh_user))
{
    die "user not specified!";
}

if (!defined ($gh_repo))
{
    die "repo not specified!";
}

if (($ENV{GITHUB_USERS} || '') =~ m{,\Q$gh_user\E,})
{
    print "git\@github.com:$gh_user/$gh_repo.git\n";
}
else
{
    print "https://github.com/$gh_user/$gh_repo.git\n";
}
