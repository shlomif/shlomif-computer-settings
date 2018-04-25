#!/bin/bash
prefix="$HOME/apps/perl/modules"
# args="--prefix=$prefix --install_path extradata=$prefix/extradata"
args="--prefix=$prefix"
~/apps/perl/perl-5.8.8-debug/bin/perl Build.PL $args
./Build test $args
./Build install $args
