load_common mymake
load_common completion
load_common prompt
load_common git

# repos="https://svn.berlios.de/svnroot/repos/fc-solve/abc-path/"
# repos_trunk="${repos}trunk/"


mod="Games-ABC_Path-Solver"
base="$HOME/progs/games/abc-path"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/abc-path/$mod/"
# c_src="$trunk/nurikabe-solver"
this="$module"

remote_repo="$(_shlomif_github "abc-path")"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='abc-path'
