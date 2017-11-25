load_common mymake
load_common completion
load_common no_implicit_make
load_common hg

base="$HOME/Docs/Philosophy/Putting-More-Cards-2014"
hg_base="$base"
trunk="$base/hg"
main="$trunk/putting-more-cards-on-the-table-2014"
this="$main"

proj_name='more-cards-2014'

cd $this

prompt()
{
    __prompt_cmd \
        "\$main=$main" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

