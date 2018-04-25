load_common mymake
load_common completion
load_common prompt
load_common hg
# load_common gen_patch

base="$HOME/progs/perl/Quizzes/quiz_of_the_week/hard-2008-12-28-sokoban"
hg_base"$base"
trunk="$base/trunk"
modules_dir="$trunk/modules"
soko_solve="$modules_dir/Shlomif-Sokoban-Solver"
this="$soko_solve"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="sokoban_solver")"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__dist_name()
{
    (__check_for_distro &&
        cat META.yml | grep "^name:" | sed 's/^name: *//'
    )
}

__version()
{
    (__check_for_distro &&
        cat META.yml | grep "^version:" | sed 's/^version: *//'
    )
}

__check_for_distro()
{
    if [ -e "META.yml" ] ; then
        return 0
    else
        echo "Not a distro dir" 1>&2
        return 1
    fi
}

__test_distribution()
{
    __check_for_distro &&
    (
        make disttest
        rm -fr "$(__dist_name)-$(__version)"
    )
}

__myctags()
{
    ( cd "$this" && ctags -R )
}

cd $this

prompt()
{
    __prompt_cmd \
        "\$soko_solve=$soko_solve" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "
