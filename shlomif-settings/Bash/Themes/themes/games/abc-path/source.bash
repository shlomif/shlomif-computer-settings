load_common mymake
load_common completion
load_common prompt

repos="https://svn.berlios.de/svnroot/repos/fc-solve/abc-path/"
repos_trunk="${repos}trunk/"

mod="Games-ABC_Path-Solver"
base="$HOME/progs/games/abc-path"
trunk="$base/trunk"
module="$trunk/abc-path/$mod/"
# c_src="$trunk/nurikabe-solver"

this="$module"

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

setup()
{
    cd "$base"
    svn co "$repos_trunk"
    cd "$this"
}

PS1="\\u:\$(prompt)\\$ "
