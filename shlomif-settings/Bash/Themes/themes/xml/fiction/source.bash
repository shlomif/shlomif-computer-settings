load_common mymake
load_common completion
load_common prompt
load_common hg
load_common perl_dzil

# load_common gen_patch
base="$HOME/progs/perl/cpan/XML/Grammar/Fiction"
hg_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/perl/modules"
fict="$modules_dir/XML-Grammar-Fiction"
this="$fict"

remote_repo="$(_shlomif_bitbucket "fiction-xml")"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$fict=$fict" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-fiction'
