#! /usr/bin/env perl
#
# add-num-suffixes.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
use strict;
use warnings;
use 5.014;
use autodie;
use bigint;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $FACTOR = ( $ENV{FACTOR} // 1 );

sub convert_to_suffixed
{
    my $n = shift(@_) * $FACTOR;
    my $str;
    if ( $n > 1024 )
    {
        $n = int( $n / 1024 );
        if ( $n > 1024 )
        {
            $n = int( $n / 1024 );
            if ( $n > 1024 )
            {
                $n = int( $n / 1024 );
                if ( $n > 1024 )
                {
                    $n   = int( $n / 1024 );
                    $str = $n . "T";
                }
                else
                {
                    $str = $n . "G";
                }
            }
            else
            {
                $str = $n . "M";
            }
        }
        else
        {
            $str = $n . 'K';
        }
    }
    else
    {
        $str = $n;
    }
    die if !defined $str;
    return $str;
}

while ( my $l = <> )
{
    $l =~ s#\b([0-9]+)\b#convert_to_suffixed($1)#egms;
    print $l;
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
