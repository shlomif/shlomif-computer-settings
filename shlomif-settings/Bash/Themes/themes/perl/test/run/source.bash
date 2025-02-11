load_common bundle/inc1
load_common bundle/git
load_common ctags_using_script
load_common perl_mb

base="$HOME/progs/perl/cpan/Test/Test-Harness"
git_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/modules"
test_run="$modules_dir/Test-Run"
core="$test_run"
cmdline="$modules_dir/Test-Run-CmdLine"
this="$test_run"
harness="$base/Test-Harness-2.56"
plugins="$modules_dir"
collect_stats="$plugins/Test-Run-Plugin-CollectStats"
build_scripts_dir="$trunk/build/test-and-install-all-modules"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

remote_repo="$(_shlomif_github "perl-test-run")"
PATH="$inst_modules_dir/bin/:$PATH"

__install_to_temp()
{
    (
        make -f "$modules_makefile" "$(pwd)"
    )
}

__prepare_install_all_to_temp_makefile()
{
    (cd "$build_scripts_dir" && perl create-makefile.pl)
}

__install_all_to_temp()
{
    (
    set -e -x
    target="$1"
    shift
    make_params=""
    if test "$target" = "runtest"
    then
        make_params="$make_params TEST_TARGET=runtest"
    fi
    (
        make -f "$modules_makefile" all $make_params
    )
)
}

prompt()
{
    __prompt_cmd \
        "\$plugins=$plugins" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Test-Run'

cd "$this"
