load_common mymake
load_common prompt
load_common no_implicit_make

base="$HOME/Docs/programming/Perl/web-sites/perl-begin"
trunk="$base/trunk"
this="$trunk"

cd $this


prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u[perl-begin]:\$(prompt)\\$ "

