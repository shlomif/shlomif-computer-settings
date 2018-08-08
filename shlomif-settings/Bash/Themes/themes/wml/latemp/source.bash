load_common mymake
load_common prompt
load_common git

base="$HOME/progs/wml/Latemp"
git_base="$base/latemp"
trunk="$git_base/trunk"
this="$trunk/installer"
site="$trunk/site/wml"
# test_dir="$trunk/tests/integration/sites-gen"
modules="$trunk/Perl/modules"

remote_repo="$(_thewml_github "latemp")"

prompt()
{
    __prompt_cmd "\$modules=$modules" "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

proj_name='latemp'
cd "$this"
