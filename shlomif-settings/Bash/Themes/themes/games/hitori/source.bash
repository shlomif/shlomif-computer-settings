load_common mymake
load_common completion
load_common hg

base="$HOME/progs/games/hitori"
hg_base="$base"
trunk="$base/trunk"
solver="$trunk/hitori-solver-in-ruby"
this="$solver"

remote_repo='ssh://hg@bitbucket.org/shlomif/hitori'
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
