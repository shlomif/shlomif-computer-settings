load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/Module/Starter"
trunk="$base/hg/trunk"
this="$trunk"
__perl_version="5.8.8"
build_scripts_dir="$trunk/build/test-and-install-all-modules"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

cd $this

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}
