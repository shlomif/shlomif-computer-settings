# latemp.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

if test -z "$latemp_trunk"
then
    latemp_trunk="$trunk"
fi

rebuild()
{
    (
        set -x
        set -e
        cd "$latemp_trunk"
        time bin/rebuild
    )
    n -m "rebuild"
}

b()
{
    (cd "$latemp_trunk" && gmake -j16 && gmake test ; n --msg "gmake")
}

alias t='b'

__add_to_path()
{
    export PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$HOME/apps/test/wml/bin:$PATH"
    export PATH="$HOME/apps/quadpres/bin:$HOME/Download/unpack/xml/ebookmaker:$trunk/node_modules/.bin:$this/node_modules/.bin:$PATH:/usr/sbin" QUAD_PRES_QUIET=1
    dedup_pathvar PATH
    dedup_pathvar PERL5LIB
    dedup_pathvar PYTHONPATH
}
export HTML_VALID_VNU_JAR=~/Download/unpack/net/www/validator/build/dist/vnu.jar
load_common latemp_diff
