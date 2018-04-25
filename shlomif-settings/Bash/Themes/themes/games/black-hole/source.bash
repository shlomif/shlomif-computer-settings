load_common mymake
load_common completion
load_common prompt
load_common git

base="$HOME/progs/games/black-hole-solitaire"
hg_base="$base"
trunk="$base/trunk"
proj="$trunk/black-hole-solitaire"
module="$proj/Games-Solitaire-BlackHole-Solver"
c_src="$proj/c-solver"
c_build="$c_src/B"
a_src="$c_src"
a_build="$c_build"
b="$c_build"
c="$c_src"

this="$c_src"

remote_repo="$(_shlomif_github "black-hole-solitaire")"

export FCS_USE_TEST_RUN=1

cd "$this"

t()
{
    (
    cd "$trunk"
    rm -fr black-hole-solitaire/B/
    perl black-hole-solitaire/CI-testing/continuous-integration-testing.pl
    )
}

e()
{
    (cd "$this" && gvim -p $(ack -f lib/))
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$c_src=$c_src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='black-hole'
