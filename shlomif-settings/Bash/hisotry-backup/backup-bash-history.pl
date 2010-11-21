#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;
use String::ShellQuote;

use POSIX (qw(strftime));

my $backup_base = "$ENV{HOME}/Backup/bash-history";
my $trunk = "$backup_base/trunk";
copy("$ENV{HOME}/.bash_history", "$trunk/bash-history/bash_history");
my $date=strftime("+%Y-%m-%d-%H:%M:%S", localtime());

my $file = shell_quote("$trunk/bash-history/bash_history");
my $num_lines=`wc -l $file`;
($num_lines) = ($num_lines =~ m{(\d+)});

if (system("svn", "commit", "-q", "-m", "Commiting the bash_history as of $date\nContaining $num_lines lines.", $trunk))
{
    die "svn command failed";
}
