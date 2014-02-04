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

u_buildreq()
{
    _sys u --buildrequires "$(pwd)"/SPECS/*.spec
}

u_rpms()
{
    _sys sudo urpmi "$(pwd)"/RPMS/*/*.rpm
}

force_u_rpms()
{
    _sys sudo rpm -Uvh --force "$(pwd)"/RPMS/*/*.rpm
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
    coo `perlmf rpm_dash "$1"`
}

alias imp='mgarepo import'
alias sub='mgarepo submit'
alias co='mgarepo co'
alias ci='mgarepo ci'
# alias b='mgarepo build -v -v'
alias b='bm -l -b'
alias sd='mgarepo sync -d'

e()
{
    gvim SPECS/*.spec
}

li()
{
    rm -fr SRPMS
    bm -s
    _sys rpmlint SRPMS/*.src.rpm
}

alias lin='li'
alias lint='li'

coo()
{
    local pkg="$1"
    shift

    co "$pkg" && cd "$pkg"
}

log()
{
    local cmd='svn log -v . > svn.log'
    echo "$cmd"
    eval "$cmd"
}

myq()
{
    local p="$1"
    shift
    urpmq --sources "$p"
    svn st "$p"/
}

mu()
{
    magpie update
}

pp()
{
    cd "$mag_base"
    pco "$@"
}

PS1="\\u[rpms]:\$(prompt)\\$ "


disable_local_lib
cd "$this"
