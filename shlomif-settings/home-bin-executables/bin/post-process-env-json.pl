#! /usr/bin/env perl
#
# Post process SaveEnv json output
# Run with:
#
#   $ perl -lpi /path/to/env-postprocess.pl [filenames]
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

s/^ *"TMUX_PANE": "%[0-9]+",/        "TMUX_PANE": "%1",/ms;
{
    my $needle = q/"GIMPGITBUILD__BUILD_GIMP_USING_MESON": "1",/;
    my $repl   = q/"GIMPGITBUILD__BUILD_GIMP_USING_MESON": "0",/;
    s/\Q$needle\E/$repl/gms;
}
s%("/home/shlomif/Download/unpack/graphics/gimp/[^"]*/tmp(?:/\.libs/)?)[^/"]*%$1%gms;
s%("/home/shlomif/Download/unpack/graphics/gimp/[^"]*/tests/\.libs/)[0-9]*%$1%gms;
s%(^ *"SHLVL": ")[0-9]+(",)%${1}5${2}%gms;
s%("/tmp/tmp)[^/"]*%$1%gms;
s%("/tmp/)[^/"]*(/dummy\.c")%$1$2%gms;
s%(["/]g-ir-cpp)[^/"]*(\.[ic]")%$1$2%gms;

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
