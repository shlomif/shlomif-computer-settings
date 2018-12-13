#!/usr/bin/env perl

use strict;
use warnings;

use YAML::XS qw/ DumpFile LoadFile /;

my $specific_fn = './bin/required-modules.yml';
my $common_fn   = './bin/common-required-deps.yml';
my $specific    = LoadFile($specific_fn);
my $common      = LoadFile($common_fn);

foreach my $key ( keys( %{ $common->{required}->{perl5_modules} } ) )
{
    delete $specific->{required}->{perl5_modules}->{$key};
}
$specific->{required}->{executables} = [
    grep
    {
        my $exe = $_->{exe};
        !grep { $_->{exe} eq $exe } @{ $common->{required}->{executables} }
    } @{ $specific->{required}->{executables} }
];

DumpFile( $specific_fn, $specific );

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
