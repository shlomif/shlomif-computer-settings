#!/usr/bin/perl

use strict;
use warnings;
use autodie;
use File::Path qw/ mkpath /;
use Cwd qw/ getcwd /;

sub do_system
{
    my ($args) = @_;

    my $cmd = $args->{cmd};
    print "Running [@$cmd]\n";
    if ( system(@$cmd) )
    {
        die "Running [@$cmd] failed!";
    }

    return;
}

sub cwd_cmd
{
    my ($args) = @_;

    my $pwd = getcwd();

    chdir($args->{dir});

    do_system({ cmd => $args->{cmd} });

    chdir($pwd);

    return;
}

my $HOME = $ENV{HOME};
my $CONF = "$HOME/conf";
my $trunk = "$CONF/trunk";

mkpath($CONF);

cwd_cmd(
    {
        dir => $CONF,
        # cmd => ["git", "clone", 'git@github.com:shlomif/shlomif-computer-settings.git', $trunk,],
        cmd => ["git", "clone", 'https://github.com/shlomif/shlomif-computer-settings.git', $trunk,],
    }
);

sub sub_c
{
    my ($sub_dir, $cmd) = @_;

    return cwd_cmd(
        {
            dir => "$trunk/shlomif-settings/$sub_dir",
            cmd => $cmd,
        }
    );
}

sub run_setup
{
    return sub_c(shift, ['./setup']);
}

run_setup('Bash');
run_setup('build-scripts');
run_setup('clang-format');
run_setup('gdb');
run_setup('git');
run_setup('rpm');
run_setup('sky');
run_setup('tmux');
run_setup('vim-conf');
