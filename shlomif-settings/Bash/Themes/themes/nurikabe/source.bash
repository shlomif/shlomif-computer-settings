load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/games/nurikabe"
trunk="$base/trunk"
c_src="$trunk/nurikabe-solver"
module="$c_src/Games-Nurikabe-Solver"

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

PS1="\\u:\$(prompt)\\$ "

