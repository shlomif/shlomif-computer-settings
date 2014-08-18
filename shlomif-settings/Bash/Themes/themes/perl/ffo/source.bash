load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/File/Find-Object"
ffo_trunk="$base/trunk"
module="$ffo_trunk"
bench="$base/benchmark"
berlios_base="$base/from-berlios"
hg_base="$berlios_base"
berlios_trunk="$berlios_base/trunk"
ffor_trunk="$berlios_trunk"
rule_trunk="$berlios_trunk/File-Find-Object-Rule"
libfilefind="$berlios_trunk/libfilefind/c_glib_based"
rule_remote_repo='ssh://hg@bitbucket.org/shlomif/perl-file-find-object-rule'
ffo_remote_repo='ssh://hg@bitbucket.org/shlomif/perl-file-find-object'

this="$module"

setup()
{
    (
        mkdir -p "$hg_base"
        cd "$hg_base"
        hg clone "$rule_remote_repo" "$ffor_trunk"
        mkdir -p "$base"
        cd "$base"
        hg clone "$ffo_remote_repo" "$ffo_trunk"
    )
    cd "$this"
}
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

proj_name='File-Find-Object'

