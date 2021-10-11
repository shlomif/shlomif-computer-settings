proj_name='PySolFC'
load_common bundle/git
load_common chdirs
load_common data_caches

base="$HOME/progs/games/pysolfc"
git_dir="$base/git"
trunk="$git_dir/PySolFC"
server="$git_dir/pysol-sound-server"
site="$git_dir/pysolfc-web-site"
proj="$trunk"
a="$proj"

this="$trunk"

remote_repo="$(_shlomif_github "PySolFC")"

export FCS_USE_TEST_RUN=1
export PATH="$HOME/apps/fcs-for-pysol/bin:$PATH"
export HARNESS_OPTIONS='j9:c'
export TEST_TAGS=" SKIP_GTK "

cd "$this"

ce()
{
    cd "$server"
}

edit()
{
    gvim +mak\ clean +mak\ PYTHON=python3
}

t()
{
    cd "$this" && make test
    n --msg "PySolFC test suite finished"
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

L()
{
    (cd "$this/pysollib/$1" && ls *.py)
}

dups()
{
    for i in $(L tk) ; do
        if cmp -s "$this/pysollib/tk/$i"  "$this/pysollib/tile/$i" ; then
            echo "$i"
        fi
    done
}

mydiff()
{
    fn="$1"
    shift
    diff -u "$this/pysollib/tk/$fn"  "$this/pysollib/tile/$fn"
}

cs()
{
    cd "$site"
}
