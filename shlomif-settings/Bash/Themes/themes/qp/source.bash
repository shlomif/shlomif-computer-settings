load_common mymake
load_common read_hist
load_common completion
load_common git

base="$HOME/progs/quadpres"
git_base="$base"
trunk="$base/trunk"
this="$trunk/installer"
site="$trunk/site"

remote_repo="$(_shlomif_github "quad-pres")"

cd "$this"

read_hist "$theme"

b="$trunk/b"

t()
{
    (
        mkdir "$b" &&
            cd "$b" &&
            cmake "$this" &&
            make &&
            make check &&
            cd ".." &&
            rm -fr b
        )
}

b()
{
    mkdir -p "$b"
    cd "$b"
    cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/test/wml" "$this" && \
        make -j4 && \
        make install
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
