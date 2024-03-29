#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 3;

{
    # TEST
    is(
        scalar(
`echo -n "1000000 242424" | shlomif-settings/home-bin-executables/bin/commify`
        ),
        "1,000,000 242,424",
        "commify is working"
    );

    # TEST
    is(
        scalar(
`echo -n "1000000000000000000000000000000000000000000000000000000000000000000000000" | shlomif-settings/home-bin-executables/bin/commify`
        ),
"1,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000",
        "commify is working"
    );

    # TEST
    is(
        scalar(
`echo -n "05 1000000 242424" | shlomif-settings/home-bin-executables/bin/commify`
        ),
        "05 1,000,000 242,424",
        "leading 0s in commify is working"
    );
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
