load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/File/Dir-Dumper"
trunk="$base/trunk"
module="$trunk/File-Dir-Dumper"

this="$module"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

e()
{
    (cd "$this" && gvim -p $(ack -f lib/))
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "

