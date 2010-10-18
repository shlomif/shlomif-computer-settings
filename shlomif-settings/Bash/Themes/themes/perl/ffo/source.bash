load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/File/Find-Object"
trunk="$base/trunk"
module="$trunk"
bench="$base/benchmark"
berlios_trunk="$base/from-berlios/trunk"
rule_trunk="$berlios_trunk/File-Find-Object-Rule"
libfilefind="$berlios_trunk/libfilefind/c_glib_based"

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

