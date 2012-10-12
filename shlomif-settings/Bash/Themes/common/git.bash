setup()
{
    (
        mkdir -p "$git_base"
        cd "$git_base"
        hg clone "$remote_repo" "$trunk"
    )
    cd "$this"
}
