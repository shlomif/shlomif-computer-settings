#!/usr/bin/perl

use strict;
use warnings;

use File::Find::Object;
use File::Basename;
use String::ShellQuote;
use List::MoreUtils (qw(any));

my $filename = shift;

if ( !defined($filename) )
{
    die "Filename not specified!";
}

my $tree = File::Find::Object->new( {}, "." );

while ( my $r = $tree->next() )
{
    if ( basename($r) eq ".svn" )
    {
        $tree->prune();
    }
    elsif ( basename($r) eq $filename )
    {
        my $dir = dirname($r);

        my $cmd = shell_quote( "svn", "propget", "svn:ignore", $dir );
        my @ignore = `$cmd`;
        chomp(@ignore);
        if ( any { $_ eq $filename } @ignore )
        {
            # Do nothing - it's already in ignore.
        }
        else
        {
            push @ignore, $filename;
            my $new_ignore = join( "",
                map { "$_\n" } sort { $a cmp $b }
                grep { length($_) > 0 } @ignore );
            system( "svn", "propset", "svn:ignore", $new_ignore, $dir );
        }
        $tree->prune();
    }
}

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
