# The MIT / Expat License
#
# Copyright (c) 2012, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

load_common bundle/inc1
load_common sys
load_common ssh_add
load_common trim_pathes

# Too long $PATH is causing a lib/perlbug.t test failure
trim_pathes

base="$HOME/progs/Rpms"
b="$base"
s="$base/SRPMS"
fed_base_base="$HOME/Download/unpack/fedora"
fed_base="$fed_base_base"
this="$fed_base"
t="$this"
proj_name='rpms'

fed_username="$(whoami)"

cb()
{
    cd "$base"
}

ct()
{
    cd "$this"
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
    if test -z "$USE_URPMI"
    then
        _sys sudo dnf $SHLOMIF_DNF_OPTS -y builddep "$(pwd)"/SPECS/*.spec
    else
        _sys sudo urpmi --auto --buildrequires "$(pwd)"/SPECS/*.spec
    fi
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
        "\$fed_base=$fed_base" \
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
    gvim -o svn.log SPECS/*.spec
}

li()
{
    rm -fr SRPMS
    bm -s
    _sys rpmlint SRPMS/*.src.rpm
}

alias lin='li'
alias lint='li'

log()
{
    local cmd='svn log -v . > svn.log'
    echo "$cmd"
    eval "$cmd"
}

alias L='log'

coo()
{
    local pkg="$1"
    shift

    local pkg_base="${pkg#*/}"

    if ! { co "$pkg" && cd "$pkg_base" && log }
    then
        return 1
    fi
    # A global variable for convenience
    p="$pkg_base"
    # A global variable with the directory, so one can do "cd $d" or "rm -fr $d"
    # etc.
    d="$(pwd)"
}


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
    cd "$fed_base"
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
        mgarepo maintdb set "$pkg" "$fed_username"
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

__commit_new_version()
{
    local __cmd="$(rpmspec -P SPECS/*.spec | perl -MSQ -lnE 'say "ci -m ${S}- New version $_${S}" if s/\Aversion:\s*//i')"
    if test -n "$__cmd"
    then
        (
        set -e -x
        eval "$__cmd"
        )
    fi
}

alias civ='__commit_new_version'

pymode()
{
    r()
    {
        local msg="${1:-Rebuild for python3 3.7}"
        shift
        b && ur && ci -m "$msg" && sub
        n --msg "rpm/mag"
    }
}

pymod=''

pymodepkg()
{
    r()
    {
        set -x
        r_helper "$@"
        set +x
    }

    r_helper()
    {
        pymod="$1"
        shift
        if ! pyco "$pymod"
        then
            rm -f "$s"/python-"$pymod"-*.src.rpm
            pyp2rpm --srpm -p3 "$pymod" || return
            imp -l "pyp2rpm" "$s/python-$pymod"-*.rpm || return
            pyco "$pymod" || return
        fi
        ub || return
        b || return
        sub || return
    }
}

disable_local_lib
cd "$this"
