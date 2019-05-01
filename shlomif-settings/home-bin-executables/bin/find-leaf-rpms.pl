#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
my %installed = ( map { chomp; $_ => +{} }
        `rpm -qa --qf "%{n}\\n" | grep -vP '^(task-shlomif|msttcorefonts)\$'` );

my @installed_rpms = sort keys %installed;
open my $in_fh, "-|", "bash", "-c",
    qq#urpmq --debug --whatrequires @installed_rpms 2>&1#;
while ( my $l = <$in_fh> )
{
    if ( my ( $requires, $what_req ) =
        ( $l =~ /\Aadding package (\S+) \(requires ([^\) ]+)/ ) )
    {
        if ( exists $installed{$requires} and exists $installed{$what_req} )
        {
            $installed{$what_req}{$requires} = 1;
        }
    }
}
foreach my $rpm (@installed_rpms)
{
    my @found = grep { $_ ne $rpm } sort keys %{ $installed{$rpm} };
    print "$rpm\t" . scalar(@found) . "\t" . join( ',', @found ) . "\n";
}

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
