#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long qw(GetOptions);

my $auth = 1;

my $gh_user;
my $gh_repo;
my $gitlab    = '';
my $bitbucket = '';

GetOptions(
    'bitbucket!' => \$bitbucket,
    'gitlab!'    => \$gitlab,
    'user=s'     => \$gh_user,
    'repo=s'     => \$gh_repo,
) or die "GetOptions failed! $!";

if ( !defined($gh_user) )
{
    die "user not specified!";
}

if ( !defined($gh_repo) )
{
    die "repo not specified!";
}

my $host = $gitlab ? "gitlab" : $bitbucket ? "bitbucket" : "github";
my $tld  = "com";
$tld = "org" if $bitbucket;
if ( ( $ENV{GITHUB_USERS} || '' ) =~ m{,\Q$gh_user\E,} )
{
    print "git\@$host.$tld:$gh_user/$gh_repo.git\n";
}
else
{
    print "https://$host.$tld/$gh_user/$gh_repo.git\n";
}
