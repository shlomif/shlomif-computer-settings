#! /bin/bash
#
# oh-my-zsh.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

if ! git hub clone https://github.com/shlomif/oh-my-zsh ~/.oh-my-zsh
then
git clone https://github.com/shlomif/oh-my-zsh ~/.oh-my-zsh
fi
cd ~/.oh-my-zsh
git checkout shlomif-custom

