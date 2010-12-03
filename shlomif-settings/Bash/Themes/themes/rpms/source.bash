load_common mymake
load_common completion
load_common prompt
load_common sys

base="$HOME/progs/Rpms"
s="$base/SRPMS"
this="$s"

k()
{
    _sys scp "$@" kenobi:
}

uq()
{
    local pm="$1"
    shift
    pm="$(echo "$pm" | perl -lpe 's/-\d.*//')"

    _sys urpmq -i "$pm"
}

prompt()
{
    __prompt_cmd \
        "\$base=$base" \
        "~=$HOME"
}


PS1="\\u[rpms]:\$(prompt)\\$ "

cd "$this"
