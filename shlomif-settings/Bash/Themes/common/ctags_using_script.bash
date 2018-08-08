# ctags_using_script.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}
