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
    cat ${__themes_dir}/list-of-themes.txt | perl -0777 -lap -e 's/[\s\n]+/ /g'
}

__reload_themes_completion()
{
    for cmd in $__theme_completion_commands
    do
        echo "cmd=$cmd"
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
