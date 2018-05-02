load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/cpan/XML/Grammar/Fortune"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/XML-Grammar-Fortune/module"
this="$module"

remote_repo="$(_shlomif_bitbucket "fortune-xml")"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-fortune'

cd $this
