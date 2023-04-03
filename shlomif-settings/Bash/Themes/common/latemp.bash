# latemp.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

if test -z "$latemp_trunk"
then
    latemp_trunk="$trunk"
fi

rebuild()
{
    (
        (
            set -x
            set -e
            cd "$latemp_trunk"
            time bin/rebuild
        )
        code="$?"
        n -m "rebuild"
        exit "$code"
    )
}

build_cmd()
{
    (
        set -e -x
        (
            cd "$latemp_trunk"
            gmake -j16
            gmake test
        )
        code="$?"
        n --msg "gmake"
        exit "$code"
    )
}

b()
{
    build_cmd
}

t()
{
    build_cmd
}

__add_to_path()
{
    export PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$HOME/apps/test/wml/bin:$PATH"
    export PATH="$HOME/apps/quadpres/bin:$HOME/Download/unpack/xml/ebookmaker:$trunk/node_modules/.bin:$this/node_modules/.bin:$PATH:/usr/sbin" QUAD_PRES_QUIET=1
    dedup_pathvar PATH
    dedup_pathvar PERL5LIB
    dedup_pathvar PYTHONPATH
}
export HTML_VALID_VNU_JAR=~/Download/unpack/net/www/validator/build/dist/vnu.jar
load_common data_caches
load_common latemp_diff
