#!/usr/bin/env bash

(

_myfind()
{
    local mydir='themes'
    find "$mydir" -type d -exec test -e {}/source.bash \; -print |
            perl -lpE "s!^\\Q$mydir\\E/!!"
}

    (
        _myfind
        (cd ~/conf/Bash/private-themes && _myfind)
    ) \
    | sort
) > list-of-themes.txt
