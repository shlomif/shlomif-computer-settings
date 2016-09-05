_shlomif_github()
{
    local repo="$1"
    shift

    $__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="$repo"
}
