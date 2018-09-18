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

    chdir( $args->{dir} );

    do_system( { cmd => $args->{cmd} } );

    chdir($pwd);

    return;
}

my $HOME  = $ENV{HOME};
my $CONF  = "$HOME/conf";
my $trunk = "$CONF/trunk";

mkpath($CONF);

cwd_cmd(
    {
        dir => $CONF,

# cmd => ["git", "clone", 'git@github.com:shlomif/shlomif-computer-settings.git', $trunk,],
        cmd => [
            "git", "clone",
            'https://github.com/shlomif/shlomif-computer-settings.git', $trunk,
        ],
    }
);

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

sub run_setup
{
    return sub_c( shift, ['./setup'] );
}

run_setup('Bash');
run_setup('bash-aliases');
run_setup('build-scripts');
run_setup('clang-format');
run_setup('gdb');
run_setup('git');
run_setup('hg');
run_setup('perl/Dist-Zilla');
run_setup('perl/perldb');
run_setup('perl/perltidy');
run_setup('rpm');
run_setup('sky');
run_setup('tmux');
run_setup('vcs-checkout-scripts');
run_setup('vim-conf');
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
