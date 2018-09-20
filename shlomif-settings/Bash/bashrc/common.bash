# common.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/bashrc.d/*.bash
do
    . "$f"
done
PATH="$HOME/apps/neovim/bin:$HOME/apps/fop/fop-20140425:$HOME/apps/vim/bin:$PATH"
dedup_pathvar PATH
