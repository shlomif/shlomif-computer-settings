load_common prompt

setup()
{
    (
        mkdir -p "$hg_base"
        cd "$hg_base"
        hg clone "$remote_repo" "$trunk"
    )
    cd "$this"
}

_shlomif_bitbucket()
{
    local repo="$1"
    shift

    $__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="$repo"
}

__hg_ps1()
{
    hg prompt "{ on {branch}}{ at {bookmark}}{status}" 2> /dev/null
}

__hg_prompt_branch()
{
    hg prompt "{branch}" 2> /dev/null
}

__prompt_branch()
{
    echo -n '@'
    __hg_prompt_branch
}
