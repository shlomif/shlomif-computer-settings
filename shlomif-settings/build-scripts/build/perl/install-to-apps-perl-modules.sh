#!/bin/bash

b_pl="Build.PL"
prefix="$HOME/apps/perl/modules"

if test -e "$b_pl" ; then
    (
        unset PERL_MM_OPT
        unset MODULEBUILDRC
        args="--prefix=$prefix"
        perl "$b_pl" $args && \
            ./Build build $args && \
            ./Build test $args && \
            ./Build install $args
    )
else
    (
        perl Makefile.PL PREFIX="$prefix" INSTALLSITEBIN="\$(SITEPREFIX)/bin" INSTALLSITESCRIPT="\$(SITEPREFIX)/bin" && \
        make && \
        make test && \
        make install
    )
fi
