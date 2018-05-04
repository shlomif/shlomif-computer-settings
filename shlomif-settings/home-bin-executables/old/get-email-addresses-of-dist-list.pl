#!/usr/bin/perl

use strict;
use warnings;

my $data_dir       = "$ENV{HOME}/.kde/share/apps/kabc";
my $dist_list_name = q{"Beta Readers" Distribution List};
open my $in, "<", "$data_dir/distlists";
my $found = 0;
my $members_string;
while (<$in>)
{
    if (/^$dist_list_name=(.*),/)
    {
        $members_string = $1;
        $found          = 1;
        last;
    }
}
close($in);
if ( !$found )
{
    die "Could not find $dist_list_name";
}
my @members = split( /,,/, $members_string );

# print map { "$_\n" } @members;
my %emails = ( map { $_ => undef } @members );

sub get_line
{
    $_ = <$in>;
    if ( !defined($_) )
    {
        return undef;
    }
    s{\r?\n?$}{};
    return $_;
}
open $in, "<", "$data_dir/std.vcf";
while ( defined( get_line() ) )
{
    if (/^BEGIN:VCARD$/)
    {
        my ( $uid, $email );
    UID_LOOP: while ( defined( get_line() ) )
        {
            if (/^END:VCARD$/)
            {
                if ( !defined($uid) )
                {
                    die "Error uid not defined at line $.\n";
                }
                if ( exists( $emails{$uid} ) )
                {
                    if ( !defined($email) )
                    {
                        die "Error email not defined for UID $uid\n";
                    }
                    elsif ( defined( $emails{$uid} ) )
                    {
                        die "Duplicate Entry for ID $uid!\n";
                    }
                    else
                    {
                        $emails{$uid} = $email;
                    }
                }
                last UID_LOOP;
            }
            elsif (/^EMAIL;TYPE=PREF:(.*)$/)
            {
                if ( defined($email) )
                {
                    die "Duplicate E-mail at line $.!\n";
                }
                else
                {
                    $email = $1;
                }
            }
            elsif (/^UID:(.*)$/)
            {
                if ( defined($uid) )
                {
                    die "Duplicate UID at line $.!\n";
                }
                else
                {
                    $uid = $1;
                }
            }
        }
    }
}
close($in);

my $output = "";
foreach my $m (@members)
{
    if ( defined( $emails{$m} ) )
    {
        $output .= $emails{$m} . "\n";
    }
    else
    {
        die "Missing E-mail for UID $m!\n";
    }
}
print $output;

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
