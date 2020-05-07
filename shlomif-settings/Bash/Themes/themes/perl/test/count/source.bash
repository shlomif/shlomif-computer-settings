load_common bundle/git
load_common perl_dzil
load_common ctags_this

remote_repo="$(_shlomif_github "perl-test-count")"

base="$HOME/progs/perl/cpan/Test/Count"
git_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/modules"
test_count="$modules_dir/Test-Count"
this="$test_count"
build_scripts_dir="$trunk/build/test-and-install-all-modules"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

PATH="$inst_modules_dir/bin/:$PATH"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Test-Count'
cd "$this"
