#! /bin/bash
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

_mylocate_hg()
{
    locate -e --regex /\\.hg\$ | grep -v /old-hg/ | grep -vE '^/home/shlomif/Download/unpack/sys/smem/hg' |grep -vE '^/home/shlomif/Download/unpack/net/pidgin/' | grep -vE '^/home/shlomif/Download/unpack/conf/hg-prompt/hg-prompt' | perl -lpE 's#/.hg$##' |tee a
}

hgl()
{
    _mylocate_hg "$@"
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
