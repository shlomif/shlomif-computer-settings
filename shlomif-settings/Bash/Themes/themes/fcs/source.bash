load_common mymake
load_common completion
load_common prompt

fcs="$HOME/progs/freecell"
branches="$fcs/branches"
trunk="$fcs/hg/fc-solve"
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

export LIBAVL2_SOURCE_DIR="$HOME/Download/unpack/prog/c/avl-2.0.3/"

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

PS1="\\u[fcs]:\$(prompt)\\$ "

