#!/bin/bash
mv unpack/home unpack/H
rm -fr unpack/H &
(cd unpack && mkdir -p home/shlomif && cd home/shlomif && tar -xvf ../../../backup.tar && \du . > du.txt )
