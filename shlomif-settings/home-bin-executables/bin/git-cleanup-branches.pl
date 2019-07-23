#! /usr/bin/env perl
#
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my @todel = qw%
    Games-Solitaire-Verify--for-Perlito--Get-Rid-of-Getopt-Long
    check-travis-fail
    clang--elim-warnings
    clang--elim-warnings--take2
    convert-py-code-to-python3
    convert-from-ctypes-to-cffi
    convert-site-away-from-Joose
    elim-clang-warnings
    elim-gcc-warnings-using-unreachable
    enable-website-travis
    enable-website-travis--using-emsdk-non-docker
    feature-branch--depth-dbm-solver--batches--issue7
    fix-gcc8-warnings
    fix-web-site-browser-tests
    investigate-slowdown
    investigate-slowdown-2
    investigate-slowdown-3
    investigate-slowdown-4
    investigate-slowdown-5
    investigate-why-solution-lengths-are-not-products-of-10--using-fc-solve-3.24.0
    investigating-slowdown-bad-8.57s-benchmarks
    investigating-slowdown-good-8.42s-benchmarks
    investigating-slowdown-trying-to-revert-the-revert-of-commit-while-using-l-ci7b
    kpat-kde-405187
    kpat-kde-405187--2
    kpat-kde-405187--merged
    %;

@todel = qw%
    origin/hoard-malloc-crash
    origin/hoard-malloc-crash-2
    origin/hoard-malloc-crash-2@3487
    origin/hoard-malloc-crash-2@3680
    origin/hoard-malloc-crash@2892
    origin/hoard-malloc-crash@2895
    origin/hoard-malloc-crash@3680
    %;
my @remotes = (qw/ origin bitbucket /);

foreach my $rem (@remotes)
{
    foreach my $d (@todel)
    {
        system( "git", "push", $rem, "--delete", $d );
    }
}

foreach my $rem (@remotes)
{
    system( "git", "fetch", $rem, "--prune" );
}

system( "git", "branch", "-d", @todel );

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
