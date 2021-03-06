load_common mymake
load_common completion
load_common prompt
load_common sys
load_common ssh_add

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

PS1="\\u[rpms]:\$(prompt)\\$ "

alias imp='mdvsys import'
alias sub='mdvsys submit'
alias co='mdvsys co'
alias ci='mdvsys ci'
alias b='mdvsys build -v -v'

cd "$this"
