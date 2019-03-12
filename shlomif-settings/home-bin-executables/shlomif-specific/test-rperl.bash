#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

perl Makefile.PL
make
rm -fr _Inline
for f in t/*.t ; do
    echo "====[[ Running test script $f ]]===="
    perl -Ilib "$f"
done
