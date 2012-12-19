load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make

fcs="$HOME/progs/freecell"
base="$fcs"
branches="$fcs/branches"
_base_trunk="$fcs/git"
trunk="$_base_trunk/fc-solve"
t_fcs="$trunk/fc-solve"
c_src="$t_fcs/source"
site="$t_fcs/site/wml"
blog="$t_fcs/site/blog"
presets="$t_fcs/presets/soft-threads/meta-moves/auto-gen"
atomic_presets="$t_fcs/presets/soft-threads/atomic-moves/auto-gen"
verify="$trunk/Games-Solitaire-Verify/Games-Solitaire-Verify"
bench="$t_fcs/benchmarks"
test_dir="$branches/trunk/testing/source"
dd_branch="$branches/depth-dependent-moves-order/source"
parallel="$t_fcs/scripts/parallel-solve-and-verify-for-bakers-game"

this="$c_src"
# this="$dd_branch"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'ssh://git@bitbucket.org/shlomif/fc-solve.git' "$trunk"
        cd "$trunk"
        git remote add github 'git@github.com:shlomif/fc-solve.git'
    )
    cd "$this"
}

export LIBAVL2_SOURCE_DIR="$HOME/Download/unpack/prog/c/avl-2.0.3/"
export FCS_USE_TEST_RUN=1

# This causes problems with the threaded solver.
unset MALLOC_CHECK_

cd $this

prompt()
{
    __prompt_cmd \
        "\$verify=$verify" \
        "\$parallel=$parallel" \
        "\$presets=$presets" \
        "\$atomic_presets=$atomic_presets" \
        "\$trunk=$trunk" \
        "\$fcs=$fcs" \
        "~=$HOME"
}

t()
{
    (cd "$c_src" && perl run-tests.pl)
}

make()
{
    if [ "$*" = "pgo" ]; then
        `which make` VERBOSE=1 "$@"
    else
        `which make` "$@"
    fi
}

PS1="\\u[fcs]:\$(prompt)\\$ "

