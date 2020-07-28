load_common bundle/git
load_common chdirs

remote_repo="$(_shlomif_github "freecell-pro-0fc-deals")"
git_base="$HOME"/Download/unpack/games/freecell
base="$git_base"
this="$git_base/freecell-pro-0fc-deals"
trunk="$this"
c="$this"

bindir="$HOME/progs/freecell/git/0fc-debug"
PATH="$HOME/apps/fcs-0fc-debug/bin:$bindir:$bindir/board_gen:$PATH"
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

__mytimestamper()
{
    timestamper-with-elapsed --from-start
}

__myprettyprinter()
{
    commify | __mytimestamper
}

generate_log()
{
    (
        set -e -x
        pi-make-microsoft-freecell-board -t 4080477571 | stdbuf -o0 -e0 fc-solve -mi 3000000 -i -s -p -t -sam -sel --iter-output-step 1 --freecells-num 0 -to 0AB -sp r:tf - > log
    )
}
alias genlog=generate_log
alias gen_log=generate_log

process_log_with_irreversible_rank()
{
    (
        set -e -x
        perl ~/progs/freecell/git/fc-solve/cpan/Games-Solitaire-Verify/Games-Solitaire-Verify/script/irreversible-moves-score-solitaire-filter--quicker-and-dirtier.pl log > proclog
    )
}

count_irrev()
{
    grep -hE '^Irrev' proclog | uniq -c
}

find_lower_depths()
{
    min_depth="${1:-${MIN_DEPTH}}"
    (
        set -e -x
        export MIN_DEPTH="${min_depth}"
        < proclog perl -lnE 'BEGIN { $MIN_DEPTH = int($ENV{MIN_DEPTH}); } say "$.:$_" if (/^Depth: ([0-9]+)/ and $1 < $MIN_DEPTH)'
    )
}

proj_name='0fc-DEBUG'
