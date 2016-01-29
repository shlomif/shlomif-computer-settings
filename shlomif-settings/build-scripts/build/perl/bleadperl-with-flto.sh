#!/bin/sh
rm -f config.sh Policy.sh
# -flto does not work properly in gcc-4.9.x without -ffat-lto-objects
sh -x Configure -de -Dprefix=$HOME/apps/perl/bleadperl -Doptimize='-O3 -march=native -flto -ffat-lto-objects -Werror=implicit-function-declaration' -Dldflags='-flto -ffat-lto-objects' -Dusedevel
