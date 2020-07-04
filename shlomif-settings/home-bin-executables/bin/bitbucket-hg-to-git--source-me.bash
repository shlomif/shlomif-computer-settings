#!/usr/bin/env bash
#
# h.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

# Bash/zsh functions to help in converting from bitbucket and mercurial
# to github and git. See:
#
# * https://bitbucket.org/blog/sunsetting-mercurial-support-in-bitbucket
#
# * https://www.shlomifish.org/humour/fortunes/sharp-programming.html#the-last-mercurialian

export UNPACK_PATH="$HOME/Download/unpack"
_mylocate_hg()
{
    locate -e --regex /\\.hg\$ | grep -v /old-hg/ | perl -lnE 'BEGIN{$re=qr#\A\Q$ENV{UNPACK_PATH}\E/(net/pidgin|conf/hg-prompt/hg-prompt|games/ksokoban/ksokoban-code)#ms}; say if ($_ !~ $re);' | perl -lpE 's#/.hg$##' | tee a
}

hgl()
{
    _mylocate_hg "$@"
}

_hgfastexp()
{
    (
    set -e -x
    mkdir repo-git # or whatever
    cd repo-git
    git init
    bash ~/Download/unpack/to-del/fast-export/hg-fast-export.sh -r ..
    git checkout HEAD
    cd ..
    bn="$(basename "$(pwd)")"
    cd ..
    mkdir -p old-hg
    mv "$bn" old-hg/
    mv old-hg/"$bn"/repo-git "$bn"
    )
}
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
w()
{
    _hgfastexp
}
