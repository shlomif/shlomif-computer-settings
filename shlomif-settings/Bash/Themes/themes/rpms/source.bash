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

toxz()
{
    gunzip ~/*.tar.gz
    xz -9 --extreme ~/*.tar
}

prompt()
{
    __prompt_cmd \
        "\$base=$base" \
        "~=$HOME"
}

pco()
{
    mdvsys co `perlmf rpm_dash "$1"`
}

__sa()
{
    ssh-add
}

PS1="\\u[rpms]:\$(prompt)\\$ "

__sa
cd "$this"

