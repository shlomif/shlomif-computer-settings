load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/eatline"
trunk="$base/trunk"
module="$trunk/perl-prototype/Term-Eatline"
this="$module"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}
cd $this
