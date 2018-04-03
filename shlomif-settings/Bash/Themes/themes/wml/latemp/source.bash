load_common mymake
load_common prompt
load_common git
# load_common gen_patch

base="$HOME/progs/wml/Latemp"
git_base="$base/latemp"
trunk="$git_base/trunk"
this="$trunk/installer"
site="$trunk/site/wml"
# test_dir="$trunk/tests/integration/sites-gen"
modules="$trunk/Perl/modules"

remote_repo="$(_thewml_github "latemp")"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__gvim_completion()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -f -X '*~' -- "$cur") )
}

complete -o filenames -F __gvim_completion gvim

__dist_name()
{
    (cd "$this" &&
        cat META.yml | grep "^name:" | sed 's/^name: //'
    )
}

__version()
{
    (cd "$this" &&
        cat ver.txt
    )
}

prompt()
{
    __prompt_cmd "\$modules=$modules" "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

proj_name='latemp'

cd $this
