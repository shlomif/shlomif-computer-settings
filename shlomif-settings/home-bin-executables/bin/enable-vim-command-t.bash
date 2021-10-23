#!/usr/bin/env bash
set -e -x
cd ~/.vim/Command-T/ruby/command-t/ext/command-t
make clean || true
ruby extconf.rb
make
gem i neovim
