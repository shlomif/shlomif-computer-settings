#!/bin/bash
export PERL_AUTOINSTALL=--alldeps
perl -MCPANPLUS::Configure -e 'my $conf = CPANPLUS::Configure->new(); $conf->set_conf("prereqs" => 1); $conf->save();'
# cpanp -i Term::ReadLine::Gnu KiokuDB KiokuDB::Backend::DBI DBD::SQLite Moose
cpanp -i Term::ReadLine::Gnu
