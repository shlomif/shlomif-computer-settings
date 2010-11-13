load_common mymake
load_common prompt
load_common completion
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

up()
{
    (cd "$trunk" && make upload upload_hexten)
}

PS1="\\u[perl-begin]:\$(prompt)\\$ "

