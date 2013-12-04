alias screen='screen -e "^^6"'

_sys()
{
    echo "$@"
    "$@"
}

u()
{
    local common_args
    common_args="--auto --keep --resume --noclean"
    if test -n "$PROZ" ; then
        common_args+=" --downloader prozilla --prozilla-options '-k=${PROZ_N:-15} -r'"
    else
        common_args+=" --downloader wget --wget-options -c"
    fi
    cmd="_sys sudo urpmi"
    ( cd $HOME ;
        eval "$cmd $common_args $@";
    )
}

uas()
{
    u --auto-select "$@"
}

uu()
{
    (cd $HOME ; sudo urpmi.update -a)
}

up()
{
    sudo urpmi --auto $(perlmf as_rpm_colon "$@")
}

function _cpan_d_format()
{
    (
    if test -e /etc/mageia-release ; then
        echo "CPANPLUS::Dist::Mageia"
    else
        echo "CPANPLUS::Dist::Mdv"
    fi
    )
}

function c()
{
    sudo cpan2dist --verbose --format="$(_cpan_d_format)" \
        --defaults --install --timeout 0 $(perlmf as_colon "$@")
}

function qp()
{
    local pm="$1"
    shift

    urpmq --whatprovides "$(perlmf as_rpm_colon "$pm")" ;
}

function pap()
{
    sudo apt-get install $(perlmf as_deb "$@");
}

e()
{
    sudo urpme "$@"
}

# urpme orphans.
eo()
{
    e --auto-orphans
}

alias q='urpmq --fuzzy -a'
alias qv='q --sources'

