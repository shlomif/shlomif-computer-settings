#!/bin/bash
dir="$(pwd)"
mkdir -p ~/conf
cd ~/conf
ln -s "$dir/gdb" gdb
cd ~
ln -s "$dit/dot-gdbinit.gdb" .gdbinit
