load_common mymake
# load_common gen_patch

base="$HOME/Download/unpack/file/gringotts"
trunk="$base/Svn/trunk"
this="$trunk"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/web-cpan/nav-menu"
read_repos_url="svn://svn.berlios.de/web-cpan/nav-menu"
test_dir="$trunk/tests/integration/sites-gen"

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

