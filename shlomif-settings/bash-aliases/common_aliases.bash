export SHLOMIF_DNF_OPTS="--color=never"

_sys()
{
    echo "$@"
    "$@"
}

u()
{
    local common_args="-y"
    cmd="_sys sudo dnf $SHLOMIF_DNF_OPTS install"
    ( cd $HOME ;
        eval "$cmd $common_args $@";
    )
}

uas()
{
    _sys sudo dnf $SHLOMIF_DNF_OPTS -y upgrade --refresh
}

uu()
{
    uas
}

up()
{
    sudo dnf  $SHLOMIF_DNF_OPTS -y install $(perlmf as_rpm_colon "$@")
}

_cpan_d_format()
{
    (
    if test -e /etc/mageia-release ; then
        echo "CPANPLUS::Dist::Mageia"
    else
        echo "CPANPLUS::Dist::Fedora"
    fi
    )
}

c()
{
    cpan2dist --verbose --format="$(_cpan_d_format)" \
        --defaults --install --timeout 0 $(perlmf as_colon "$@")
}

qp()
{
    local pm="$1"
    shift

    dnf $SHLOMIF_DNF_OPTS search --whatprovides "$(perlmf as_rpm_colon "$pm")" ;
}

pap()
{
    sudo apt-get install $(perlmf as_deb "$@");
}

e()
{
    sudo dnf $SHLOMIF_DNF_OPTS remove "$@"
}

# urpme orphans.
eo()
{
    sudo dnf $SHLOMIF_DNF_OPTS autoremove
}

alias q="dnf $SHLOMIF_DNF_OPTS search"
alias qv='q --source'

__delegate_complete()
{
    local to="$1"
    shift
    local from="$1"
    shift

if test -n "$BASH_VERSION"
then
    complete -F "$to" "$from"
elif test -n "$ZSH_VERSION"
then
    compdef "$from=$tp"
fi
}

if test -n "$BASH_VERSION"
then
    complete -F dnf u
    complete -F dnf e
    complete -F dnf q
    complete -F dnf qv
elif test -n "$ZSH_VERSION"
then
    __complete_e() {
        ((CURRENT++))
        words=(sudo dnf remove "${words[@]:1}")
        _normal
    }
    compdef __complete_e e
    __complete_u() {
        ((CURRENT++))
        words=(dnf install "${words[@]:1}")
        _normal
    }
    compdef __complete_u u
fi

alias hc='htop -s PERCENT_CPU'
alias hm='htop -s PERCENT_MEM'
alias qvim='nvim-qt'
