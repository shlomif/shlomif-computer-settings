# Copyright (c) 2020 Shlomi Fish ( https://www.shlomifish.org/ )
# Author: Shlomi Fish ( https://www.shlomifish.org/ )
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

__private_themes_dir="$HOME/conf/Bash/private-themes"

load_common()
{
    source "${__themes_dir}/common/$1.bash"
}

__this_theme_dir()
{
    local DIR F

    for DIR in "${__themes_dir}" "${__private_themes_dir}" ; do
        F="$DIR/themes/$__theme"
        if test -e "$F" ; then
            echo "$F"
            return 0
        fi
    done

    return 1
}

__this_theme_source()
{
    echo "$(__this_theme_dir)/source.bash"
}

Theme()
{
    local filename

    __theme="$1"
    shift;

    filename="$(__this_theme_source)"
    test -e "$filename" || { echo "Unknown theme" 1>&2 ; return 1; }
    source "$filename"
}

__theme_completion_commands=''

__list_themes()
{
    local fn="${__themes_dir}/list-of-themes.txt"
    if ! test -e "$fn"
    then
        ( cd "$__themes_dir" && bash gen_list.sh )
    fi
    cat "$fn" | perl -0777 -lap -e 's/[\s\n]+/ /g'
}

__reload_themes_completion()
{
    for cmd in $__theme_completion_commands
    do
        if test -n "$BASH_VERSION"
        then
            complete -W "$(__list_themes)" -- "$cmd"
        elif test -n "$ZSH_VERSION"
        then
            compdef "_values description $(__list_themes)" "$cmd"
        fi
    done
}

__complete_with_themes()
{
    cmd="$1"
    shift

    # Uniqify them.
    __theme_completion_commands="$(echo "$__theme_completion_commands $cmd" |perl -0777 -pe 's/\s+/\n/g' | sort | uniq)"

    __reload_themes_completion
}

__complete_with_themes "Theme"
