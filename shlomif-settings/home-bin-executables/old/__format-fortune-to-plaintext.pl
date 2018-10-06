#!/usr/bin/env perl

use strict;
use warnings;

use Text::Format;
use List::Util qw(max);

my $longest_nick_len = 0;
my @messages;
while (<>)
{
    chomp;
    if (m{^[^<\*]*(<[^>]+>|\*)\t(.*)$})
    {
        my ( $nick, $msg ) = ( $1, $2 );
        push @messages, { 'type' => "say", 'nick' => $nick, 'msg' => $msg };
        $longest_nick_len = max( $longest_nick_len, length($nick) );
    }
    elsif (m{^[^\-]* ---\t(\S+) is now known as (\S+)})
    {
        my ( $old_nick, $new_nick ) = ( $1, $2 );
        push @messages,
            { 'type' => "change_nick", 'old' => $old_nick, 'new' => $new_nick };
        $longest_nick_len =
            max( $longest_nick_len, length($old_nick), length($new_nick) );
    }
    else
    {
        push @messages, { 'type' => "raw", 'msg' => $_ };
    }
}
my $formatter = Text::Format->new(
    {
        columns     => 72 - 1 - 2 - $longest_nick_len,
        firstIndent => 0,
        leftMargin  => 0,
    }
);

for my $m (@messages)
{
    if ( $m->{'type'} eq "say" )
    {
        my @lines = ( $formatter->format( [ $m->{'msg'} ] ) );
        print " "
            . sprintf( "%${longest_nick_len}s", $m->{'nick'} ) . "  "
            . $lines[0];
        print map { ( " " x ( 1 + 2 + $longest_nick_len ) ) . $_ }
            @lines[ 1 .. $#lines ];
    }
    elsif ( $m->{'type'} eq "raw" )
    {
        print $m->{'msg'}, "\n";
    }
    elsif ( $m->{'type'} eq "change_nick" )
    {
        print " " x ( $longest_nick_len + 3 )
            . $m->{'old'}
            . " is now known as "
            . $m->{'new'} . "\n";
    }
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
