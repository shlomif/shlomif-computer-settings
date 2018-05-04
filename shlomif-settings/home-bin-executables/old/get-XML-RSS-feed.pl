#!/usr/bin/perl

use strict;
use warnings;

my $url =
      q{https://rt.cpan.org/Search/Results.rdf?Query=Queue}
    . q{%20%3D%20'XML-RSS'%20AND%20(%20Status%20%3D%20'new'}
    . q{%20OR%20Status%20%3D%20'open'%20OR%20Status}
    . q{%20%3D%20'stalled'%20)};

my $cmd = shift;
if ( $cmd eq "print" )
{
    print $url;
}
elsif ( $cmd eq "fetch" )
{
    system( "wget", "--no-check-certificate", "-O", "hello.rdf", $url );
}
else
{
    die "Unknown command";
}

=head1 COPYRIGHT & LICENSE

Copyright 2017 by Shlomi Fish

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
