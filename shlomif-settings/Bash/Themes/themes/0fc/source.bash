load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "freecell-pro-0fc-deals")"
git_base="$HOME"/Download/unpack/games/freecell/freecell-pro-0fc-deals
this="$git_base"
c="$this"

PATH="/home/shlomif/apps/fcs/bin:$PATH"
cd "$this"

c()
{
    cd "$c"
}

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
