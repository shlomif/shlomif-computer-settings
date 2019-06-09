load_common bundle/git
load_common chdirs

remote_repo="$(_shlomif_github "freecell-pro-0fc-deals")"
git_base="$HOME"/Download/unpack/games/freecell
base="$git_base"
this="$git_base/freecell-pro-0fc-deals"
trunk="$this"
c="$this"

bindir="$HOME/progs/freecell/git/0fc-b/"
PATH="/home/shlomif/apps/fcs/bin:$bindir:$bindir/board_gen:$PATH"
cd "$this"

m()
{
    make "$@"
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

ci7()
{
    git commit -F "$this/add-more-to-log-commit-msg-7.txt"
}

ci()
{
    git commit -F "$this/add-more-to-log-commit-msg.txt"
}

put()
{
    (
        set -x
        rm -f offload/fcs_queue*
        rm -fr offload/deal*
        perl apply-solve-more-3-log.pl ; n
        git au
        ci
    )
}

put7()
{
    (
        set -x
        perl apply-solve-more-3-log.pl ; n
        git au
        ci7
    )
}

alias c=put
alias c7=put7

run()
{
    (
        set -e -x
        set -o pipefail
        bash solve-more-6-gnupar.bash | commify | timestamper
    )
}

run7()
{
    (
        set -e -x
        set -o pipefail
        bash solve-more-7-gnupar.bash | commify | timestamper
    )
}

# alias r=run
alias r=run7

proj_name='0fc'
