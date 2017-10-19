_shlomif_github()
{
    local repo="$1"
    shift

    $__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="$repo"
}
_shlomif_gitlab()
{
    local repo="$1"
    shift

    $__themes_dir/common/github-git-remote-repo.pl --gitlab --user="shlomif" --repo="$repo"
}
_thewml_github()
{
    local repo="$1"
    shift

    $__themes_dir/common/github-git-remote-repo.pl --user="thewml" --repo="$repo"
}
