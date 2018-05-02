load_common mymake
load_common completion
load_common prompt
load_common hg
# load_common gen_patch

base="$HOME/progs/perl/cpan/Text/Qantor"
hg_base="$base"
trunk="$base/trunk"
this="$trunk/Text-Qantor"
remote_repo="$(_shlomif_bitbucket "qantor")"
rw_repos_url="https://svn.berlios.de/svnroot/repos/web-cpan/Text-Qantor"
read_repos_url="http://svn.berlios.de/svnroot/repos/web-cpan/Text-Qantor"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='qantor'
cd $this
