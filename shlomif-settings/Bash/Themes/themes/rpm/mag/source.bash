load_common mymake
load_common completion
load_common prompt
load_common sys
load_common ssh_add
load_common trim_pathes

# Too long $PATH is causing a lib/perlbug.t test failure
trim_pathes

base="$HOME/progs/Rpms"
b="$base"
s="$base/SRPMS"
mag_base="$HOME/Download/unpack/Mageia"
this="$mag_base"
t="$this"
proj_name='rpms'

mag_username="$(whoami)"

cb()
{
    cd "$base"
}

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
    _sys u --no-recommends --buildrequires "$(pwd)"/SPECS/*.spec
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

pyco()
{
    coo "python-$1"
}

alias imp='mgarepo import'
alias sub='mgarepo submit'
alias co='mgarepo co'
alias ci='mgarepo ci'
alias b='bm -l -b'
alias sd='mgarepo sync -d'
alias ub='u_buildreq'
alias ur='u_rpms'

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

    local pkg_base="${pkg#*/}"

    co "$pkg" && cd "$pkg_base"
    # A global variable for convenience
    p="$pkg_base"
    # A global variable with the directory, so one can do "cd $d" or "rm -fr $d"
    # etc.
    d="$(pwd)"
}

log()
{
    local cmd='svn log -v . > svn.log'
    echo "$cmd"
    eval "$cmd"
}

alias L='log'

myq()
{
    local p="$(echo -n "$1" | perl -pE 's#/+##')"
    shift
    urpmq --sources "$p"
    svn st "$p"/
}

mu()
{
    magpie update --nosleep
}

pp()
{
    local pkg="$1"
    shift
    cd "$mag_base"
    local perl_pkg="$(perlmf rpm_dash "$pkg")"
    if ! test -e "$perl_pkg" ; then
        co "$perl_pkg"
    fi
    _sys cd "$perl_pkg"
}

# Set me as the maintainer of some packages
Set()
{
    for pkg in "$@" ; do
        mgarepo maintdb set "$pkg" "$mag_username"
    done
}

m()
{
    pco "$1" && mu
}

bn()
{
    basename "$(pwd)"
}

ex()
{
    extract-mageia-updates-cpan-updates http://check.mageia.org/cauldron/shlomif/updates.html > ~/y40.txt
    . ~/conf/trunk/shlomif-settings/home-bin-executables/bin/magpie-update-multiple.bash
}

rej()
{
    find . -name '*.rej' | perl -lanE 'print s/\.rej$//r, "\n", ,$_'  | sort | xargs gvim -o
}

rec()
{
    bash ~/bin/recursive-patch.bash "$1" */
}

disable_local_lib
cd "$this"
