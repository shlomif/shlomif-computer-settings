setup()
{
    (
        mkdir -p "$git_base"
        cd "$git_base"
        git clone "$remote_repo" "$trunk"
    )
    cd "$this"
}

_shlomif_github()
{
    local repo="$1"
    shift

    $__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="$repo"
}
