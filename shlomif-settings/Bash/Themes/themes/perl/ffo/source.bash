load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/cpan/File/Find-Object"
ffo_trunk="$base/trunk"
module="$ffo_trunk"
bench="$base/benchmark"
berlios_base="$base/from-berlios"
hg_base="$berlios_base"
berlios_trunk="$berlios_base/trunk"
trunk="$berlios_trunk"
rule_trunk="$berlios_trunk/File-Find-Object-Rule"
libfilefind="$berlios_trunk/libfilefind/c_glib_based"
remote_repo='ssh://hg@bitbucket.org/shlomif/perl-file-find-object-rule'

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
        "\$libfilefind=$libfilefind" \
        "\$rule_trunk=$rule_trunk" \
        "\$berlios_trunk=$rule_trunk" \
        "\$ffo_trunk=$ffo_trunk" \
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

