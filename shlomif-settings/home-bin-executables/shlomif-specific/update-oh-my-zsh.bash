#! /bin/bash
#
# update-oh-my-zsh.bash
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

set -e -x
cd ~/.oh-my-zsh/
git co master
git s u master
git co shlomif-custom
git rebase master
git pull --rebase origin shlomif-custom
git push
