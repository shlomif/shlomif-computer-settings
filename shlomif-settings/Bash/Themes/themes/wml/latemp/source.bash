load_common bundle/git

base="$HOME/progs/wml/Latemp"
git_base="$base/latemp"
trunk="$git_base/trunk"
this="$trunk/installer"
site="$trunk/site/wml"
# test_dir="$trunk/tests/integration/sites-gen"
modules_="$trunk/Perl/modules"

remote_repo="$(_thewml_github "latemp")"

prompt()
{
    __prompt_cmd "\$modules_=$modules_" "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

__run_tests()
{
    (cd "$trunk" && perl CI-testing/continuous-integration-testing.pl test)
}

t()
{
    __run_tests "$@"
}

proj_name='latemp'
cd "$this"
