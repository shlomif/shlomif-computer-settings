#! /usr/bin/env perl

use strict;
use warnings;
use 5.014;
use autodie;

use List::Util qw/ uniq /;
use Path::Tiny qw/ path tempdir tempfile cwd /;

my @todel = qw%
    %;

@todel = uniq(
    grep {
       # m%(?:Shlomi_Fish|rcs-states-storage|New-Site|Version-2_[68]_|mdv-hang)%
        m%
        (?:
        befs
        | feature-branch--depth-dbm-solver--condvars--issue8
  | feature-branch--penguin-solving-wrapper
  | feature-branch--store-cols-inside-pointers
  | feature-branch-opt-reverse-bool
  | feature-branch--try-shell-sort
  | cmake-gnu-install-dirs--feature-branch
  | feature-branch--make-rank-king-compile-time-configurable
  | zerofc
  )
  %msx
        }
        map {
        my $branch = $_;
        chomp $branch;
        $branch =~ s/\A\s*//;
        my @components = split( m#/#, $branch, -1 );
        (
            scalar( $branch =~ s#\A.*/##mrs ),
            (
                  ( @components == 4 or @components == 2 )
                ? ( join "/", @components[ -2 .. -1 ] )
                : ()
            )
        )
        } path("$ENV{HOME}/branches.txt")->lines_utf8
);

# die "@todel";

# @todel = grep { /Shlomi_Fish/ } @todel;
my @remotes = (qw/ origin bitbucket /);

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

foreach my $rem (@remotes)
{
    foreach my $d (@todel)
    {
        eval {
            do_system( { cmd => [ "git", "push", $rem, "--delete", $d ] } );
        };
    }
}

if (0)
{
    foreach my $rem (@remotes)
    {
        do_system( { cmd => [ "git", "fetch", $rem, "--prune" ] } );
    }
}

eval { do_system( { cmd => [ "git", "branch", "-D", @todel ] } ); };
path("$ENV{HOME}/deleted-branches-log.txt")
    ->append_utf8( map { "$_\n" } @todel );
__END__

=head1 COPYRIGHT & LICENSE

Copyright 2019 by Shlomi Fish

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
