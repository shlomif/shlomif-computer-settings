#! /usr/bin/env perl

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny             qw/ path tempdir tempfile cwd /;
use MetaCPAN::Client       ();
use Module::Format::Module ();
use Getopt::Long           qw/ GetOptions /;

my $rpm = 0;
GetOptions( 'rpm!' => \$rpm, )
    or die $!;

my $module = Module::Format::Module->from_guess(
    {
        value => shift(@ARGV),
    }
);

my $mod = $module->format_as('colon');

my $mcpan        = MetaCPAN::Client->new;
my $download_url = $mcpan->download_url($mod);
my $ret          = $download_url->download_url;
if ($rpm)
{
    $ret = "$ret" =~ s#/[^/]+\z#/%{upstream_name}-%{upstream_version}.tar.gz#r;
}
say $ret;

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
