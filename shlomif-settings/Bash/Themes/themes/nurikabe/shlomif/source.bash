load_common meta_inc1
load_common hg

base="$HOME/progs/games/nurikabe"
hg_base="$base"
trunk="$base/trunk"
c_src="$trunk/nurikabe-solver"
module="$c_src/Games-Nurikabe-Solver"
remote_repo="$(_shlomif_bitbucket "nurikabe")"

this="$module"

cd "$this"

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        hg clone 'ssh://hg@bitbucket.org/shlomif/nurikabe' trunk
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

proj_name='nurikabe'
