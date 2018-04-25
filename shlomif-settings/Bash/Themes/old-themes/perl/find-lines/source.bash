load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/cpan/File/Find-Object"
bench="$base/benchmark"
berlios_base="$base/from-berlios"
hg_base="$berlios_base"
berlios_trunk="$berlios_base"
trunk="$berlios_trunk"
fl_trunk="$berlios_trunk/File-FindLines/module"
module="$fl_trunk"
remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="perl-file-find-object-rule")"

this="$module"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

e()
{
    (cd "$this" && gvim -p $(ack -f lib/))
}

prompt()
{
    __prompt_cmd \
        "\$fl_trunk=$fl_trunk" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

run_prof()
{
    (cd "$bench" &&
        (
            rm -f nytprof.out
            perl -d:NYTProf -I "$trunk/lib" print-all.pl > /dev/null
            rm -fr nytprof
            nytprofhtml
            if test -z "$DONT_DEL" ; then
                rm -f nytprof.out
            fi
        )
    )
}

view_prof()
{
    (cd "$bench" &&
        (firefox ./nytprof/index.html)
    )
}

PS1="\\u:\$(prompt)\\$ "
