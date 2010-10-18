load_common mymake
load_common completion

kakuro="$HOME/progs/games/kakuro"
trunk="$kakuro/trunk"
solver="$trunk/solver/ruby"
this="$solver"

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p t/parse-board.rb kakuro-board.rb
    )
}
