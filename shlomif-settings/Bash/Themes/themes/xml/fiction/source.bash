load_common bundle/inc1
load_common hg
load_common perl_dzil
load_common ctags_using_script

base="$HOME/progs/perl/cpan/XML/Grammar/Fiction"
hg_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/perl/modules"
fict="$modules_dir/XML-Grammar-Fiction"
this="$fict"

remote_repo="$(_shlomif_bitbucket "fiction-xml")"

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
