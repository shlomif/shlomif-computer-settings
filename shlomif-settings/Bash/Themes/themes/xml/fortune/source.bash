load_common bundle/inc1
load_common git
load_common perl_dzil
load_common ctags_this

base="$HOME/progs/perl/cpan/XML/Grammar/Fortune"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/XML-Grammar-Fortune/module"
this="$module"

remote_repo="$(_shlomif_github "fortune-xml")"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-fortune'

cd "$this"
