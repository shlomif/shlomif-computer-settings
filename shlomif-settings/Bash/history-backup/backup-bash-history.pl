#!/usr/bin/perl

use strict;
use warnings;
use autodie;

use File::Copy;
use String::ShellQuote;

use POSIX (qw(strftime));

my $backup_base = "$ENV{HOME}/Backup/bash-history";
my $trunk = "$backup_base/git-repos";
copy("$ENV{HOME}/.bash_history", "$trunk/bash-history/bash_history");
my $date=strftime("+%Y-%m-%d-%H:%M:%S", localtime());

my $file = shell_quote("$trunk/bash-history/bash_history");
my $num_lines=`wc -l $file`;
($num_lines) = ($num_lines =~ m{(\d+)});

chdir($trunk) or die "Cannot chdir to '$trunk'";

if (system("git" , "add", "bash-history/bash_history"))
{
    die "git command 1 failed.";
}

if (`git status -s .` =~ /\S/)
{
    if (system("git", "commit", "-q", "-m", "Commiting the bash_history as of $date\n\nContaining $num_lines lines."))
    {
        die "git commit command failed.";
    }
}
