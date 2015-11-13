__themes_dir="$(dirname $BASH_SOURCE[-1])"
__private_themes_dir="$HOME/conf/Bash/private-themes"

function load_common
{
    source "${__themes_dir}/common/$1.bash"
}

function __this_theme_dir
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

function __this_theme_source
{
    echo "$(__this_theme_dir)/source.bash"
}

function Theme
{
    local filename

    __theme="$1"
    shift;

    filename="$(__this_theme_source)"
    test -e "$filename" || { echo "Unknown theme" 1>&2 ; return 1; }
    source "$filename"
}

__theme_completion_commands=''

function __reload_themes_completion
{
    for cmd in $__theme_completion_commands ; do
        complete -W "$(cat ${__themes_dir}/list-of-themes.txt)" "$cmd"
    done
}

function __complete_with_themes
{
    cmd="$1"
    shift

    # Uniqify them.
    __theme_completion_commands="$(echo "$__theme_completion_commands $cmd" |perl -0777 -pe 's/\s+/\n/g' | sort | uniq)"

    __reload_themes_completion
}

__complete_with_themes "Theme"

