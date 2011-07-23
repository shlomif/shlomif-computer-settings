load_common mymake
load_common completion
load_common prompt

# repos="https://svn.berlios.de/svnroot/repos/fc-solve/abc-path/"
# repos_trunk="${repos}trunk/"


mod="Games-ABC_Path-Solver"
base="$HOME/progs/games/abc-path"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/abc-path/$mod/"
# c_src="$trunk/nurikabe-solver"
this="$module"

remote_repo='ssh://hg@bitbucket.org/shlomif/abc-path'

cd "$this"

setup()
{
    (
        mkdir -p "$hg_base"
        cd "$hg_base"
        hg clone "$remote_repo" "$trunk"
    )
}

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

PS1="\\u:\$(prompt)\\$ "
