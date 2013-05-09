#!/usr/bin/perl

use strict;
use warnings;

use CPANPLUS::Configure;

my $email = 'shlomif@shlomifish.org';

my $conf = CPANPLUS::Configure->new();
$conf->set_conf( verbose => 1 );
$conf->set_conf( email => $email );
$conf->set_conf( prefer_bin => 1 );
# $conf->set_conf( enable_custom_sources => 0 );
$conf->set_conf( show_startup_tip => 0 );
$conf->set_conf( write_install_logs => 0 );
$conf->set_conf( allow_build_interactivity => 0 );
$conf->set_conf( prereqs => 1 );

$conf->save();

exit(0);
