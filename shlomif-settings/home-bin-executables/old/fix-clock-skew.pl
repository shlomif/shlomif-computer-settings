#!/usr/bin/env perl

use strict;
use warnings;

use File::Find;

sub check_file
{
    my $filename = shift;

    my @stat = stat($filename);

    my @time = (
        {
            'id'    => "a",
            'epoch' => $stat[8],
        },
        {
            'id'    => "m",
            'epoch' => $stat[9],
        }
    );
    foreach (@time)
    {
        my @expanded = localtime( $_->{epoch} );
        $_->{'expanded'} = \@expanded;
        if ( ( $expanded[5] == 104 ) && ( $expanded[4] == 4 ) )
        {
            print "Wrong Date at " . $_->{id} . "time for \"$filename\"!\n";

            # New time is the file time minus the number of seconds in April.
            $_->{'new_epoch'} = $_->{epoch} - 30 * 24 * 3600;
        }
    }
    if ( grep { exists( $_->{new_epoch} ) } @time )
    {
        utime( ( map { $_->{new_epoch} || $_->{epoch} } @time ), $filename );
    }
}

sub file_find_wrapper
{
    check_file($File::Find::name);
}
find( { "wanted" => \&file_find_wrapper, "no_chdir" => 1, }, "." );

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
