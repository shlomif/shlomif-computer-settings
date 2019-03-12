#!/usr/bin/env bash
install_base="$HOME/apps/perl/modules"
# args="--prefix=$prefix --install_path extradata=$prefix/extradata"
args="--install_base=$install_base"
perl Build.PL $args && \
    ./Build test $args && \
    ./Build install $args
