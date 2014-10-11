load_common mymake

base="$HOME/progs/C/gringotts"
_base_trunk="$base"
trunk="$base/gringotts"
c_src="$trunk/c-src"
build_dir="$trunk/B"
this="$build_dir"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'git@github.com:shlomif/gringotts.git' "$trunk"
    )
    cd "$this"
}

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__gvim_completion()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -f -X '*~' -- "$cur" |
        grep -v '/\.' | grep -v '^\.') )
}

complete -o filenames -F __gvim_completion gvim

cd $this

