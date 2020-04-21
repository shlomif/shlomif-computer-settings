#!/usr/bin/env bash
set -e -x
cd ~/.vim/Command-T/ruby/command-t/ext/command-t
ruby extconf.rb
make
gem i neovim
