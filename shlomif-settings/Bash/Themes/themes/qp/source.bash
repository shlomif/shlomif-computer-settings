proj_name='quad-pres'
load_common bundle/git
load_common chdirs
load_common data_caches

base="$HOME/progs/quadpres"
git_base="$base"
trunk="$base/trunk"
this="$trunk/installer"
site="$trunk/site"

remote_repo="$(_shlomif_github "quad-pres")"

cd "$this"

b="$trunk/b"

t()
{
    __test "$@"
}

__test()
{
    (
        mkdir -p "$b" &&
            cd "$b" &&
            cmake "$this" &&
            make &&
            make check &&
            cd ".." &&
            rm -fr b
        )
}

__test()
{
    (
        cd "$trunk" &&
        perl CI-testing/continuous-integration-testing.pl test
    )
}

b()
{
    __build "$@"
}

__build()
{
    (
        set -e -x
        mkdir -p "$b"
        cd "$b"
        cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/test/wml" "$this"
        make -j4
        make install
        cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/quadpres" "$this"
        make -j4
        make install
    )
}

__install()
{
    __test && __build
}

i()
{
    __install "$@"
}

switch_to_quadpres()
{
    local which mypath
    which="$1"
    export mypath="$HOME/apps/test/quadpres/bin"
    if [ "$which" == "local" ] ; then
        PATH="$mypath:$PATH"
        dedup_pathvar PATH
    elif [ "$which" == "global" ] ; then
        PATH="$(perl -E 'print $ENV{PATH} =~ s%\Q$ENV{mypath}\E:%%r')"
    else
        echo "Unknown QP Target $which" 1>&2
    fi
    unset mypath
}

svn_tag()
{
    # local qp_base="http://localhost:8080/svn/repos/progs/quad-pres/"
    local qp_base="https://stalker.iguide.co.il:8081/svn/lm-solve/quad-pres"
    local tag_url="$qp_base/tags/latest-devel"
    svn rm -m "Deleting Old Tag" "$tag_url"
    svn copy -m "Tagging the Latest Devel Version of Quad-Pres" "$qp_base/trunk" "$tag_url"
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}
export PATH="$HOME/apps/test/wml/bin:$PATH"
export HARNESS_OPTIONS=j4:c TEST_JOBS=4
export WMLOPTS="-q"
