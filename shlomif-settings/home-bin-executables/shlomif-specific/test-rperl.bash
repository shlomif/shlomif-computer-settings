#!/bin/bash
perl Makefile.PL
make
rm -fr _Inline
for f in t/*.t ; do
    echo "====[[ Running test script $f ]]===="
    perl -Ilib "$f"
done
