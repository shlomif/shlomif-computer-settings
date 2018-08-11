load_common mymake

base="/home/shlomi/progs/perl/Subversion/light-web-interface"
trunk="$base/trunk"
this="$trunk"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/web-cpan/svn-light-web/"
read_repos_url="svn://svn.berlios.de/web-cpan/svn-light-web"

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

__test_distribution()
{
    (
        cd "$this"
        make disttest
        rm -fr "$(cat Makefile | perl -lpE 'say if s/\ADISTVNAME = //')"
    )
}

cd "$this"
