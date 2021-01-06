#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use File::Basename qw/ dirname /;
use File::Path qw/ mkpath /;
use Getopt::Long qw/ GetOptions /;
use Cwd qw/ getcwd /;
use Carp ();

package Symlink::DSL;

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

    my ( $dest, $src );
    unless ( ( $dest, $src ) = $l =~ m#\Asymlink from ~/(\S+) to \./(\S+)\z# )
    {
        die "wrong line <$l> in @{[$self->manifest]} !";
    }
    foreach my $str ( $src, $dest )
    {
        if ( $str =~ /([^a-zA-Z\-_0-9\.\/])/ )
        {
            die
"unacceptable character $1 in line <$l> in @{[$self->manifest]} !";
        }
        if ( $str =~ m%((?:\.\.)|(?:/\./)|(?:/\.\z)|(?:\A-)|(?:/-))% )
        {
            die
"unacceptable sequence $1 in line <$l> in @{[$self->manifest]} !";
        }
    }
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
    chdir $pwd;

    return;
}

sub manifest_exists
{
    my $self = shift;

    return ( -f $self->manifest );
}

sub process_manifest
{
    my $self = shift;

    die "Manifest does not exist" if !$self->manifest_exists;

    open my $fh, "<", $self->manifest;
    while ( my $l = <$fh> )
    {
        chomp $l;
        $self->handle_line( { line => $l } );
    }
    close $fh;
    return 1;
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
            cmd => [
                "git", "clone",
                'https://github.com/shlomif/shlomif-computer-settings.git',
                $trunk,
            ],
        }
    );
}

my $ohmyzsh = "$HOME/.oh-my-zsh";
if ( !-e $ohmyzsh )
{
    cwd_cmd(
        {
            dir => $HOME,
            cmd => [
                "git", "clone", "--branch", "shlomif-custom",
                'https://github.com/shlomif/oh-my-zsh.git', $ohmyzsh,
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

sub create_manifest
{
    my $sub_dir = shift;
    my $dir     = "$trunk/shlomif-settings/$sub_dir";
    return Symlink::DSL->new( { dir => $dir, skip_re => $skip_re, } );
}

sub run_dsl
{
    my $dir = shift;
    my $obj = create_manifest($dir);
    return $obj->process_manifest;
}

sub run_setup
{
    my $dir = shift;
    return sub_c( $dir, ['./setup'] );
}
run_setup('Bash');

open my $dirs_list_fh, "<",
    "$trunk/shlomif-settings/setup-all/symlink-dsl-sub-dirs-list.txt";
while ( my $dir = <$dirs_list_fh> )
{
    chomp $dir;
    run_dsl($dir);
}
close($dirs_list_fh);
run_setup('vim-conf');

sub_c( "Bash/history-backup", [ "sh", "setup-backup-bash-history.bash" ] );

{
    my $dir = 'home-bin-executables';

    my $obj = create_manifest($dir);
    $obj->process_manifest;
    if ( `hostname` =~ m#\Atelaviv1\.shlomifish\.org$#ms )
    {
        $obj->handle_line(
            {
                line =>
'symlink from ~/bin/backup-total.sh to ./shlomif-specific/backup-total.sh'
            }
        );
    }
}

{
    my $bg_img_fn = "/usr/share/mga/backgrounds/default.png";
    my $src_fn    = "$trunk/shlomif-settings/sway/config.src";
    my $dest_fn   = "$trunk/shlomif-settings/sway/sway/config";
    if ( -e $bg_img_fn )
    {
        require Path::Tiny;
        my $src = Path::Tiny->new($src_fn);
        Path::Tiny->new($dest_fn)->spew_utf8(
            "# This file was generated from $src\n",
            "# DO NOT EDIT DIRECTLY!\n",
            "\n",

            (
                map {
s#\A(output \* bg )/usr/share/backgrounds/default\.png( fill\r?\n?)\z#${1}$bg_img_fn${2}#r;
                } $src->lines_utf8()
            )
        );
    }
    else
    {
        if ( not -e $dest_fn )
        {
            symlink( $src_fn, $dest_fn );
        }
    }
}
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
