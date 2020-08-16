# common.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#
for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/bashrc.d/*.bash
do
    . "$f"
done
PATH="$HOME/bin:$HOME/apps/perl/modules/bin:$HOME/apps/perl/modules/local/bin:$HOME/apps/neovim/bin:$HOME/apps/fop/fop-20140425:$HOME/apps/vim/bin:$PATH:/usr/games"
dedup_pathvar LD_LIBRARY_PATH
dedup_pathvar PATH
