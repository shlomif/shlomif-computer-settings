#!/usr/bin/env bash
myprefix="$HOME/apps/test/apache1-perl"
autoconf
./configure --prefix="$myprefix"
make
make test
make install
perl Makefile.PL PREFIX="$myprefix"
make
make test
make install
mkdir "$myprefix/eperl"
cp -f "$myprefix/bin/eperl" "$myprefix/eperl/nph-eperl"
