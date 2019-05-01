#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $orig_file = "/boot/grub/menu.lst";
my $new_file  = "/boot/grub/menu.lst-perlnew";
open my $in, "<", $orig_file;
open $out, ">", $new_file;
LINE_LOOP: while (<$in>)
{
    if (/^title (2\.6\.(?:\d+)(?:-rc\d+)?-g[\da-f]+)/)
    {
        my $ver = $1;
        print $ver, "\n";
        system("rm -f /boot/*$ver /boot/initrd-$ver.img");

        # Delete the paragraph.
        while (<$in>)
        {
            if (/^title/)
            {
                redo LINE_LOOP;
            }
        }
    }
    else
    {
        print $out $_;
    }
}
close($in);
close($out);
rename( $new_file, $orig_file );

=head1 COPYRIGHT & LICENSE

Copyright 2012 by Shlomi Fish

This program is distributed under the MIT (X11) License:
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
