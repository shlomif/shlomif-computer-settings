#! /bin/bash
#
# h.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#


h()
{
    hg st && hg push
    hg paths
    urlbase="$(hg paths | perl -lapE 's#.*/##')"
    url="https://bitbucket.org/shlomif/$urlbase"
    echo "$url"|xclip -selection clipboard
    firefox "$url"
}
_replace()
{
    if test "$(basename $PWD)" = .hg
    then
        cd ..
    fi
    bn="$(basename $PWD)"
    if ! test -d ../old-hg
    then
        mkdir -p ../old-hg
    fi
    cd ..
    mv "$bn" old-hg
    git clone "https://github.com/shlomif/$urlbase" "$bn"
}
r()
{
    _replace
}
