load_common bundle/git

base="$HOME/progs/games/nurikabe"
git_base="$base"
trunk="$base/trunk"
c_src="$trunk/nurikabe-solver"
module="$c_src/Games-Nurikabe-Solver"
remote_repo="$(_shlomif_github "nurikabe")"

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

proj_name='nurikabe'
