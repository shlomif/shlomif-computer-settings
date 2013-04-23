load_common mymake
load_common completion
load_common prompt
load_common hg

kakuro="$HOME/progs/games/kakuro"
hg_base="$kakuro"
trunk="$kakuro/trunk"
solver="$trunk/solver/ruby"
this="$solver"
remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="kakuro-cross-sums")"

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

