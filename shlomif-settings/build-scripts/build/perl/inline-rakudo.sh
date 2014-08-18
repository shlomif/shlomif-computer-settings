#!/bin/bash
export RAKUDO_DIR=/home/shlomi/Download/unpack/perl/Perl6/Rakudo/rakudo
export PARROT_DIR="$RAKUDO_DIR/parrot"
export LD_LIBRARY_PATH="$PARROT_DIR/blib/lib"
perl Makefile.PL PREFIX="/home/shlomi/apps/perl/modules" INSTALLSITEBIN="\$(SITEPREFIX)/bin" INSTALLSITESCRIPT="\$(SITEPREFIX)/bin"
