#!/bin/sh
export CC=`which clang` CXX=`which clang++`
rm -f config.sh Policy.sh
# -flto does not work properly in gcc-4.9.x without -ffat-lto-objects
sh Configure -de -Dprefix=$HOME/apps/perl/bleadperl -Dccflags='-Wall -Wextra -Wformat -Werror=format-security' -Doptimize='-O3 -march=native -flto -ffat-lto-objects' \
    -Dman1dir=none -Dman3dir=none
