load_common mymake
load_common completion
load_common prompt
load_common sys
load_common ssh_add

base="$HOME/progs/Rpms"
s="$base/SRPMS"
mag_base="$HOME/Download/unpack/Mageia"
this="$mag_base"

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
        "\$mageia=$mag_base" \
        "\$base=$base" \
        "~=$HOME"
}

pco()
{
    mdvsys co `perlmf rpm_dash "$1"`
}

PS1="\\u[rpms]:\$(prompt)\\$ "

alias imp='mgarepo import'
alias sub='mgarepo submit'
alias co='mgarepo co'
alias ci='mgarepo ci'
# alias b='mgarepo build -v -v'
alias b='bm -l -b'

disable_local_lib
cd "$this"
