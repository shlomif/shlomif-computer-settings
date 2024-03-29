load_common bundle/dzil_git

# repos="https://svn.berlios.de/svnroot/repos/fc-solve/abc-path/"
# repos_trunk="${repos}trunk/"


mod="Games-ABC_Path-Solver"
base="$HOME/progs/games/abc-path"
git_base="$base"
trunk="$base/trunk"
module="$trunk/abc-path/$mod/"
# c_src="$trunk/nurikabe-solver"
this="$module"

remote_repo="$(_shlomif_github "abc-path")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

ct()
{
    cd "$trunk"
}

total_tests()
{
    (
        set -e -x
        cd "$trunk"
        perl abc-path/CI-testing/continuous-integration-testing.pl install_deps
        perl abc-path/CI-testing/continuous-integration-testing.pl test
    )
}

tt()
{
    total_tests "$@"
}

proj_name='abc-path'
