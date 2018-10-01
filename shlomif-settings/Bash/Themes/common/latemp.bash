# latemp.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

rebuild()
{
    (
        set -x
        set -e
        cd "$trunk"
        time bin/rebuild
        n -m "rebuild"
    )
}

b()
{
    (cd "$trunk" && make -j16 && make test ; n --msg "make")
}

alias t='b'

export PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export PATH="$HOME/apps/quadpres/bin:$HOME/Download/unpack/xml/ebookmaker:$trunk/node_modules/.bin:$PATH:/usr/sbin" QUAD_PRES_QUIET=1
dedup_pathvar PATH
dedup_pathvar PERL5LIB
dedup_pathvar PYTHONPATH
