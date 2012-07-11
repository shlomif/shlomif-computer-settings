load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/Docs"
trunk="$base/trunk"
module="$trunk/perl5/ext-embed-internals/docbook/examples/incremental-examples-1/XSTest"

this="$module"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

e()
{
    (cd "$this" && gvim -p lib/XSTest.pm lib/XSTest.xs)
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "

