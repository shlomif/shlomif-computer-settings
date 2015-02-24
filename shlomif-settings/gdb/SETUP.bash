#!/bin/bash
dir="$(pwd)"
mkdir -p ~/conf
cd ~/conf
ln -s "$dir" gdb
cd ~
ln -s "$dir/dot-gdbinit.gdb" .gdbinit
