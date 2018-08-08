load_common mymake
load_common completion
load_common prompt
load_common git
load_common perl_dzil

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

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='abc-path'
