load_common mymake
load_common completion
load_common prompt

kakuro="$HOME/progs/games/kakuro"
hg_base="$kakuro"
trunk="$kakuro/trunk"
solver="$trunk/solver/ruby"
this="$solver"
remote_repo='ssh://hg@bitbucket.org/shlomif/kakuro-cross-sums'

setup()
{
    (
        mkdir -p "$hg_base"
        cd "$hg_base"
        hg clone "$remote_repo" "$trunk"
    )
}

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p t/parse-board.rb kakuro-board.rb
    )
}

prompt()
{
    __prompt_cmd \
        "\$solver=$solver" \
        "\$trunk=$trunk" \
        "\$base=$kakuro" \
        "~=$HOME"
}

PS1="\\u@\\h[kakuro]:\$(prompt)\\$ "

