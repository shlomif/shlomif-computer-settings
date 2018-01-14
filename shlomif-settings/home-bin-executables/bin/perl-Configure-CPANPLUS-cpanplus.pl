#!/usr/bin/perl

use strict;
use warnings;

package SmokeConf;

sub get_primary_cpan_mirror
{
    return "http://biocourse.weizmann.ac.il/CPAN/";
    # return "http://cpan.cpantesters.org/";
}

sub get_secondary_cpan_mirror
{
    return "http://cpan.cpantesters.org/";
    # return "http://ftp.nluug.nl/pub/languages/perl/CPAN/";
    # return "http://www.mirror.ac.uk/mirror/ftp.funet.fi/pub/languages/perl/CPAN/";
    # return "http://cpan.initworld.com/";
}

package main;

use CPANPLUS::Configure;

my $email = 'shlomif@shlomifish.org';

sub _get_mirror
{
    my ($id, $url) = @_;
    if (my ($scheme, $host, $path) = $url =~ m{\A(http|ftp)://([^/]+)(/.*)\z}ms)
    {
        return
        {
            "${id}_scheme" => $scheme,
            "${id}_host" => $host,
            "${id}_path" => $path,
        };
    }
    else
    {
        die "Incorrect URL id = $id ; url = $url";
    }
}

my %mirrors = (
    %{_get_mirror('m0', SmokeConf::get_primary_cpan_mirror())},
    %{_get_mirror('m1', SmokeConf::get_secondary_cpan_mirror())},
);

my $conf = CPANPLUS::Configure->new();
$conf->set_conf( verbose => 1 );
$conf->set_conf( email => $email );
$conf->set_conf( prefer_bin => 1 );
# $conf->set_conf( enable_custom_sources => 0 );
$conf->set_conf( show_startup_tip => 0 );
$conf->set_conf( write_install_logs => 0 );
$conf->set_conf( allow_build_interactivity => 0 );
$conf->set_conf( prereqs => 1 );
$conf->set_conf("hosts",
    [map
        {
            +{
                path => $mirrors{$_ . "_path"},
                scheme => $mirrors{$_ . "_scheme"},
                host => $mirrors{$_ . "_host"},
            }
        }
        (map { "m".$_ } 0 .. 1)
    ]
);
$conf->save();
$conf->save();

exit(0);

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
