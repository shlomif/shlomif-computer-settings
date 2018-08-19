load_common meta_inc1
load_common git
load_common perl_dzil
load_common ctags_this

base="$HOME/progs/perl/cpan/Statistics"
git_base="$base"
trunk="$base/trunk"
stats_dir="$trunk/Statistics-Descriptive"
this="$stats_dir"
build_scripts_dir="$trunk/build/test-and-install-all-modules"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"
remote_repo="$(_shlomif_github "perl-Statistics-Descriptive")"

PATH="$inst_modules_dir/bin/:$PATH"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Statistics-Descriptive'
cd "$this"
