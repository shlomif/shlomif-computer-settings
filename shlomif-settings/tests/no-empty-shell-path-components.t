#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 2;

sub _check_env_var
{
    my ($key) = @_;

    local $Test::Builder::Level = $Test::Builder::Level + 1;

    my $val = $ENV{$key};
    my @offending_comps;
    if ( defined $val )
    {
        my @comps = split( /:/, $val, -1 );

        @offending_comps = ( grep { /\A [\n\r\s\t]* \z/imsx } @comps );
    }

    return is_deeply( [@offending_comps], [],
        "Offending components in ENV { $key }",
    );
}

{
    # TEST
    _check_env_var("LD_LIBRARY_PATH");

    # TEST
    _check_env_var("PATH");
}

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2024 by Shlomi Fish

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
