#!/bin/bash
unset PERL_MM_OPT
unset MODULEBUILDRC
prefix="$HOME/apps/perl/modules"
# args="--prefix=$prefix --install_path extradata=$prefix/extradata"
args="--prefix=$prefix"
perl Build.PL $args && \
    ./Build test $args && \
    ./Build install $args
