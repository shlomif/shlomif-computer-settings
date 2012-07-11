load_common mymake
load_common completion

base="$HOME/progs/games/hitori"
trunk="$base/trunk"
solver="$trunk/hitori-solver-in-ruby"
this="$solver"

repos="https://svn.berlios.de/svnroot/repos/fc-solve/hitori/"
repos_trunk="${repos}trunk/"

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p hitori-solver.rb t/parse-board.rb gui/gui.pl
    )
}

setup()
{
    mkdir -p "$base"
    cd "$base"
    svn co "$repos_trunk"
}
