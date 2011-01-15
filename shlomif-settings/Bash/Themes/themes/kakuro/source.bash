load_common mymake
load_common completion

kakuro="$HOME/progs/games/kakuro"
trunk="$kakuro/trunk"
solver="$trunk/solver/ruby"
this="$solver"

setup()
{
    mkdir -p "$kakuro"
    cd "$kakuro"
    svn co 'https://svn.berlios.de/svnroot/repos/fc-solve/kakuro-cross-sums/trunk'
    cd $this
}

cd "$this"

e()
{
    (
        cd "$this" && \
        gvim -p t/parse-board.rb kakuro-board.rb
    )
}
