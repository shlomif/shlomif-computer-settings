#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use Carp       ();
use File::Copy qw/ copy /;
use POSIX (qw(strftime));

my $HOME_DIR_PATH                   = $ENV{HOME};
my $backup_repo_containing_dir_path = "$HOME_DIR_PATH/Backup/bash-history";
my $TRUNK_PATH                 = "$backup_repo_containing_dir_path/git-repos";
my $files_dir_basepath         = 'bash-history';
my $trunk_files_directory_path = "$TRUNK_PATH/$files_dir_basepath";

my @tracked_files_data = (
    {
        from => "$HOME_DIR_PATH/.bash_history",
        to   => "bash_history",
    },
    {
        from => "$HOME_DIR_PATH/.histfile",
        to   => "histfile",
    },
    {
        from => "$HOME_DIR_PATH/.mrconfig",
        to   => "mrconfig",
    },
    {
        from => "$HOME_DIR_PATH/.viminfo",
        to   => "viminfo",
    },
);

foreach my $tracked_file_record (@tracked_files_data)
{
    my $to = "$trunk_files_directory_path/$tracked_file_record->{to}";
    if ( -e $tracked_file_record->{from} )
    {
        copy( $tracked_file_record->{from}, $to );
    }
    else
    {
        if ( !-e $to )
        {
            open my $fh, ">>", $to;
            $fh->print("");
            close $fh;
        }
    }
    my $fn = $to;
    my ($num_lines) = ( `wc -l "$fn"` =~ m{([0-9]+)} )
        or Carp::confess("Cannot find num lines for $fn.");
    $tracked_file_record->{num_lines} = $num_lines;
}

my $date = strftime( "+%Y-%m-%d-%H:%M:%S", localtime() );

chdir($TRUNK_PATH)
    or Carp::confess("Cannot chdir to TRUNK_PATH = '$TRUNK_PATH'");

if (
    system(
        "git", "add",
        map { "$files_dir_basepath/$_->{to}" } @tracked_files_data
    )
    )
{
    Carp::confess(qq#git "add" command failed#);
}

if ( `git status -s .` =~ /\S/ )
{
    if (
        system(
            "git", "commit", "-q", "-m",
            "Commiting the bash_history as of $date\n\n"
                . join( "\n",
                map { "$_->{to} containing $_->{num_lines} lines." }
                    @tracked_files_data )
        )
        )
    {
        Carp::confess(qq#git "commit" command failed.#);
    }
}
