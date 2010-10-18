load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/Config/IniFiles"
trunk="$base/trunk"
module="$trunk/config-inifiles"

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
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u[cfg-ini]:\$(prompt)\\$ "

