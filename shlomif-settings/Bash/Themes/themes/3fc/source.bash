load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "freecell-3fc-determine-solvability")"
git_base="$HOME"/Download/unpack/games/freecell/freecell-3fc-determine-solvability
this="$git_base"
c="$this"

cd "$this"

c()
{
    cd "$c"
}

export PATH="$PATH:$HOME/Download/unpack/prog/python/pypy2-v5.7.1-src/pypy/goal/"

t()
{
    (
        set -x
        cd "$this" && \
        \cp -f ~/Backup/Arcs/fc-solve/from-amazon-aws/downloaded/aws-3-3fc-output.txt . && \
        pypy summarize1.py && \
        git au . && \
        git commit -m "Add more from amazon.com AWS - thanks." && \
        git push
    )
}

cb()
{
    cd "$b"
}

i()
{
    cd "$i"
}

prompt()
{
    __prompt_cmd \
        "\$this=$this" \
        "~=$HOME"
}

proj_name='3fc'
