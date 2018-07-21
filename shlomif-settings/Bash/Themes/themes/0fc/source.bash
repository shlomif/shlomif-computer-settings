load_common chdirs
load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "freecell-pro-0fc-deals")"
git_base="$HOME"/Download/unpack/games/freecell
base="$git_base"
this="$git_base/freecell-pro-0fc-deals"
trunk="$this"
c="$this"

PATH="/home/shlomif/apps/fcs/bin:/home/shlomif/progs/freecell/git/0fc-b/:$PATH"
cd "$this"

t()
{
    make total
}

prompt()
{
    __prompt_cmd \
        "\$this=$this" \
        "~=$HOME"
}

ci()
{
    git commit -F "$this/add-more-to-log-commit-msg.txt"
}

proj_name='0fc'
