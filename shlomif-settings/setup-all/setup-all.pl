#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use File::Basename qw/ dirname /;
use File::Path qw/ mkpath /;
use Getopt::Long qw/ GetOptions /;
use Cwd qw/ getcwd /;
use Carp ();

package Symlink::Manifest;

use strict;
use warnings;
use autodie;
use Cwd qw/ getcwd /;
use File::Basename qw/ dirname /;
use File::Path qw/ mkpath /;

sub new
{
    my $class = shift;

    my $self = bless {}, $class;

    $self->_init(@_);

    return $self;
}

sub _init
{
    my ( $self, $args ) = @_;
    $self->{dir} = $args->{dir};
    $self->skip_re( $args->{skip_re} );
    $self->manifest( $self->dir . "/setup.symlinks.manifest.txt" );

    return;
}

sub manifest
{
    my $self = shift;

    if (@_)
    {
        $self->{manifest} = shift;
    }

    return $self->{manifest};
}

sub skip_re
{
    my $self = shift;

    if (@_)
    {
        $self->{skip_re} = shift;
    }

    return $self->{skip_re};
}

sub dir
{
    my $self = shift;

    if (@_)
    {
        $self->{dir} = shift;
    }

    return $self->{dir};
}

sub handle_line
{
    my ( $self, $args ) = @_;

    my $l       = $args->{line};
    my $dir     = $self->dir;
    my $skip_re = $self->skip_re;
    my $pwd     = getcwd();

    if ( my ( $dest, $src ) = $l =~ m#\Asymlink from ~/(\S+) to \./(\S+)\z# )
    {
        chdir($dir);
        my $conf_dir = getcwd();
        my $h        = $ENV{HOME};
        if ( $dest =~ m#/# )
        {
            mkpath( [ "$h/" . dirname($dest) ] );
        }
        my $dd = "$h/$dest";
        my $ss = "$conf_dir/$src";
        print "Linking $dd to $ss\n";
        if ( -e $dd )
        {
            if ( ( !defined $skip_re ) or ( $dd !~ /$skip_re/ ) )
            {
                if ( not -l $dd )
                {
                    die "$dd is not a symlink!";
                }
                elsif ( readlink($dd) ne $ss )
                {
                    die "$dd does not point to $ss !";
                }
                elsif ( $ENV{V} )
                {
                    warn "Not replacing $dd";
                }
            }
        }
        else
        {
            symlink( $ss, $dd );
        }
    }
    else
    {
        die "wrong line <$l> in @{[$self->manifest]} !";
    }
    chdir $pwd;

    return;
}

package main;

my $skip_re;

GetOptions( 'skip-re=s' => \$skip_re, )
    or die "Wrong options $!";

sub do_system
{
    my ($args) = @_;

    my $cmd = $args->{cmd};
    print "Running [@$cmd]\n";
    if ( system(@$cmd) )
    {
        Carp::confess("Running [@$cmd] failed!");
    }

    return;
}

sub cwd_cmd
{
    my ($args) = @_;

    my $pwd = getcwd();

    chdir( $args->{dir} );

    do_system( { cmd => $args->{cmd} } );

    chdir($pwd);

    return;
}

my $HOME  = $ENV{HOME};
my $CONF  = "$HOME/conf";
my $trunk = "$CONF/trunk";

mkpath($CONF);

if ( !-e $trunk )
{
    cwd_cmd(
        {
            dir => $CONF,

# cmd => ["git", "clone", 'git@github.com:shlomif/shlomif-computer-settings.git', $trunk,],
            cmd => [
                "git", "clone",
                'https://github.com/shlomif/shlomif-computer-settings.git',
                $trunk,
            ],
        }
    );
}

sub sub_c
{
    my ( $sub_dir, $cmd ) = @_;

    return cwd_cmd(
        {
            dir => "$trunk/shlomif-settings/$sub_dir",
            cmd => $cmd,
        }
    );
}

sub run_manifest
{
    my $sub_dir = shift;
    my $dir     = "$trunk/shlomif-settings/$sub_dir";
    my $obj     = Symlink::Manifest->new( { dir => $dir } );
    my $ret     = ( -f $obj->manifest );
    return '' if !$ret;

    open my $fh, "<", $obj->manifest;
    while ( my $l = <$fh> )
    {
        chomp $l;
        $obj->handle_line( { line => $l } );
    }
    close $fh;
    return 1;
}

sub run_setup
{
    my $dir = shift;
    if ( !run_manifest($dir) )
    {
        return sub_c( $dir, ['./setup'] );
    }
}
run_setup('Bash');
run_setup('vim-conf');

run_setup('bash-aliases');
run_setup('build-scripts');
run_setup('clang-format');
run_setup('gdb');
run_setup('git');
run_setup('hg');
run_setup('jwm');
run_setup('perl/Dist-Zilla');
run_setup('perl/perldb');
run_setup('perl/perltidy');
run_setup('python/pdb');
run_setup('rpm');
run_setup('sky');
run_setup('tmux');
run_setup('vcs-checkout-scripts');
run_setup('x11');

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2018 by Shlomi Fish

This program is distributed under the MIT / Expat License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=cut
