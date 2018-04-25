load_common mymake
# load_common gen_patch

base="$HOME/progs/java/JMikMod/source/trunk/java"
trunk="$base"
source_dir="$trunk/source"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/jmikmod/jmikmod/"
read_repos_url="svn://svn.berlios.de/jmikmod/jmikmod/"
build_dir="$trunk/build"
this="$trunk"

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
