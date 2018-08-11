load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/Quizzes/quiz_of_the_week/hard-2008-12-28-sokoban"
hg_base"$base"
trunk="$base/trunk"
modules_dir="$trunk/modules"
soko_solve="$modules_dir/Shlomif-Sokoban-Solver"
this="$soko_solve"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="sokoban_solver")"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

__myctags()
{
    ( cd "$this" && ctags -R )
}

prompt()
{
    __prompt_cmd \
        "\$soko_solve=$soko_solve" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}
cd $this
