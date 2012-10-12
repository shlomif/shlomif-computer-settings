load_common mymake
load_common completion
load_common prompt
load_common git

kakuro="$HOME/progs/games/binarypuzzle.com"
git_base="$kakuro"
trunk="$kakuro/garden"
solver="$trunk/ruby"
this="$solver"
remote_repo='git@github.com:shlomif/binary-puzzle-garden.git'

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

PS1="\\u@\\h[binarypuzzle]:\$(prompt)\\$ "

