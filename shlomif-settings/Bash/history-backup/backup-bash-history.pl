#!/usr/bin/perl

use strict;
use warnings;
use autodie;

use File::Copy;
use String::ShellQuote;

use POSIX (qw(strftime));

my $backup_base = "$ENV{HOME}/Backup/bash-history";
my $trunk = "$backup_base/git-repos";
my $files_dir = 'bash-history';
my $trunk_files = "$trunk/$files_dir";

my $H = $ENV{HOME};
my @files =
(
    {
        from => "$H/.bash_history",
        to => "bash_history",
    },
    {
        from => "$H/.histfile",
        to => "histfile",
    },
    {
        from => "$H/.mrconfig",
        to => "mrconfig",
    },
);

foreach my $f (@files)
{
    my $to = "$trunk_files/$f->{to}";
    copy($f->{from}, $to);
    my $fn = shell_quote($to);
    my ($num_lines) = (`wc -l $fn` =~ m{([0-9]+)})
        or die "Cannot find num lines for $fn.";
    $f->{num_lines} = $num_lines;
}

my $date=strftime("+%Y-%m-%d-%H:%M:%S", localtime());

chdir($trunk) or die "Cannot chdir to '$trunk'";

if (system("git" , "add", map { "$files_dir/$_->{to}" } @files))
{
    die "git command add failed.";
}

if (`git status -s .` =~ /\S/)
{
    if (system("git", "commit", "-q", "-m", "Commiting the bash_history as of $date\n\n" . join("\n", map { "$_->{to} containing $_->{num_lines} lines." } @files)))
    {
        die "git commit command failed.";
    }
}
