#!/usr/bin/env bash
prefix="$HOME/apps/perl/Padre"
# args="--prefix=$prefix --install_path extradata=$prefix/extradata"
args="--prefix=$prefix"
~/apps/perl/perl-5.8.8-debug/bin/perl Build.PL $args
