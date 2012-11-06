load_common mymake
load_common completion
load_common prompt
load_common git

bp="$HOME/progs/games/binarypuzzle.com"
git_base="$bp"
trunk="$bp/garden"
solver="$trunk/ruby"
this="$solver"
remote_repo='git@github.com:shlomif/binary-puzzle-garden.git'

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p t/parse-board.rb binary_puzzle_solver.rb
    )
}

prompt()
{
    __prompt_cmd \
        "\$solver=$solver" \
        "\$trunk=$trunk" \
        "\$base=$bp" \
        "~=$HOME"
}

PS1="\\u@\\h[binarypuzzle]:\$(prompt)\\$ "

