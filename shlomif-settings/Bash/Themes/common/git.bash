setup()
{
    (
        if test -z "$git_base"
        then
            git_base="$(dirname "$trunk")"
        fi
        mkdir -p "$git_base"
        cd "$git_base"
        git clone "$remote_repo" "$trunk"
    )
    cd "$this"
}

load_common github
