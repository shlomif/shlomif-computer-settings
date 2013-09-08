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
