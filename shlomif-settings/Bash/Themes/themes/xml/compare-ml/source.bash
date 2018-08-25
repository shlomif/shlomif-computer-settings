load_common bundle/inc1
load_common hg

base="$HOME/progs/perl/cpan/XML/CompareML"
hg_base="$base"
trunk="$base/trunk"
this="$trunk"
rw_repos_url="svn+ssh://svn.berlios.de/svnroot/repos/web-cpan/xml-compareml"
read_repos_url="svn://svn.berlios.de/web-cpan/xml-compareml"

remote_repo="$(_shlomif_bitbucket "xml-compareml")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-compareml'
cd "$this"
