#! /usr/bin/env perl
#
# Short description for run-compiled-git-master.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
#
use 5.014;
use strict;
use warnings;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $HOME = $ENV{HOME};

sub _p
{
    my $ret = $HOME . "/" . shift();
    return ( "$ret/lib", "$ret/lib64" );
}

$ENV{LD_LIBRARY_PATH} = join ":", sort { $a cmp $b } map { _p($_) } (
    qw%
        apps/gimp-devel
        apps/graphics/babl
        apps/graphics/gegl
        apps/graphics/libmypaint
        %
);
exec( "$HOME/apps/gimp-devel/bin/gimp-2.99", @ARGV );

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2020 by Shlomi Fish

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
