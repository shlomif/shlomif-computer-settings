load_common mymake
load_common completion
load_common prompt
load_common hg
# load_common gen_patch

base="$HOME/progs/perl/cpan/XML/CompareML"
hg_base="$base"
trunk="$base/trunk"
this="$trunk"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/web-cpan/xml-compareml"
read_repos_url="svn://svn.berlios.de/web-cpan/xml-compareml"

remote_repo="$(_shlomif_bitbucket "xml-compareml")"
# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

make()
{
    local target
    target="$1"
    shift
    if [ "$target" == "all" ] ; then
        target=build
    fi
    ./Build "$target"
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
        cat META.yml | grep "^version:" | sed 's/^version: //'
    )
}

__test_distribution()
{
    (
        cd "$this"
        perl Build.PL
        ./Build disttest
        rm -fr "$(__dist_name)-$(__version)"
    )
}

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-compareml'

