__themes_dir="$(dirname $BASH_SOURCE[-1])"
__private_themes_dir="$__themes_dir/../private-themes"

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

function __complete_with_themes
{
    cmd="$1"
    shift

    complete -W "$(cat ${__themes_dir}/list-of-themes.txt)" "$cmd"
}

__complete_with_themes "Theme"

