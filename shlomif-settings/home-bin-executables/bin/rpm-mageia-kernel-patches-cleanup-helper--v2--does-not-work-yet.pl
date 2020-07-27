# ! /usr/bin/env perl
#
# rpm-mageia-kernel-patches-cleanup-helper--v2.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $RPM_ROOT = "../../../";

sub _spec
{
    return path("$RPM_ROOT/SPECS/kernel.spec");
}

sub _patch
{
    return scalar system( "bash", "-c", "set -e -x; patch @_" );
}

foreach my $l ( _spec()->lines_utf8() )
{
    if ( my ( $n, $fn ) = $l =~ /^Patch([0-9]{3,}):\s+(\S[^\n]*)\n?\z/ms )
    {
        print "n==$n\n";
        if ( $n < 2560 )
        {
            _patch(" -p1 < $RPM_ROOT/SOURCES/$fn ")
                and die $!;
        }
        else
        {
            if (
                not _patch(" -R -s -f -p1 --dry-run -i $RPM_ROOT/SOURCES/$fn ")
                )
            {
                print "ignoring n==$n\n";

                _spec()->edit_lines_utf8(
                    sub {
                        s%^(Patch\Q$n\E:\s+)%#$1%ms and print "foo $_\n";
                    }
                );
            }
        }
    }
}

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
