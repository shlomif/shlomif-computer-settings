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
        dir="$HOME/conf/Bash/private-themes"
        if test -d "$dir"
        then
            (cd "$dir" && _myfind)
        fi
    ) \
    | sort
) > list-of-themes.txt
