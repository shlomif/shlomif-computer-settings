load_common mymake
load_common prompt
load_common hg
# load_common gen_patch

base="$HOME/progs/wml/Latemp"
hg_base="$base/latemp"
trunk="$hg_base/trunk"
this="$trunk/installer"
site="$trunk/site/wml"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/web-cpan/latemp"
read_repos_url="svn://svn.berlios.de/web-cpan/latemp"
# test_dir="$trunk/tests/integration/sites-gen"
modules="$trunk/Perl/modules"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="latemp")"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__gvim_completion()
{ 
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -f -X '*~' -- "$cur" |
        grep -vP '/\.[a-zA-Z_]' | grep -vP '^\.[a-zA-Z_]') )
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

