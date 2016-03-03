load_common mymake
load_common completion
load_common prompt
load_common git

base="$HOME/Download/unpack/games/pysolfc"
trunk="$base/git/PySolFC"
proj="$trunk"
a="$proj"

this="$trunk"

remote_repo="$($__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="PySolFC")"

export FCS_USE_TEST_RUN=1

cd "$this"

t()
{
    cd "$this" && make test
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

proj_name='PySolFC'

