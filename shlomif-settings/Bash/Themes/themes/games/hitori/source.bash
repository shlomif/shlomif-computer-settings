load_common mymake
load_common completion

base="$HOME/progs/games/hitori"
trunk="$base/trunk"
solver="$trunk/hitori-solver-in-ruby"
this="$solver"

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p hitori-solver.rb t/parse-board.rb gui/gui.pl
    )
}
