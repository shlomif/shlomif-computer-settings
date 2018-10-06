#!/usr/bin/env perl

use strict;
use warnings;

use Cwd;
use Fcntl ':mode';
use File::Path;

use File::Glob ':glob';
use CPANPLUS;

use File::Find::Object;
use Term::ANSIColor;

mkdir("CPANP-TEMP");
chdir("CPANP-TEMP");

my $base_mod = shift(@ARGV);
my $dash_mod = $base_mod;
$dash_mod =~ s{::}{-}g;
my $perl_mod = $dash_mod;
$perl_mod =~ s{-}{::}g;

fetch($perl_mod);

my @arc = bsd_glob("$dash_mod-*");
if ( @arc != 1 )
{
    die "Cannot find archive.";
}

my $arc_fn = $arc[0];

open( my $tar, "-|", "tar", "-tvf", $arc_fn )
    or die "Could not open tar.";

my $perms = "drwxrwxr";
my $l     = length($perms);

my @found;
while ( my $f = <$tar> )
{
    chomp($f);
    if ( $f =~ m/\A.{$l}w/ )
    {
        push @found, $f;
    }
}
close($tar);

chdir("..");
rmtree("CPANP-TEMP");

print "\n";
if (@found)
{
    print "The $dash_mod archive contains world-writable files\n\n";
    print "Found World-writable-files:\n", ( map { "$_\n" } @found );
    print "\n";
    print colored( "Wrong.", "red" );
    print "\n";
    exit(1);
}
else
{
    print colored( "OK.", "green" );
    print "\n";
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
