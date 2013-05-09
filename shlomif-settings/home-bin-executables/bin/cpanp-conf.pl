#!/usr/bin/perl

use strict;
use warnings;

my $conf = CPANPLUS::Configure->new();
$conf->set_conf( verbose => 1 );
$conf->set_conf( cpantest => 'dont_cc' );
$conf->set_conf( cpantest_mx => $mx ) if $mx;
$conf->set_conf( email => $email );
$conf->set_conf( prefer_bin => 1 );
$conf->set_conf( makeflags => 'UNINST=1' );
$conf->set_conf( buildflags => 'uninst=1' );
$conf->set_conf( enable_custom_sources => 0 );
$conf->set_conf( show_startup_tip => 0 );
$conf->set_conf( write_install_logs => 0 );

$conf->save();

exit(0);
