load_common bundle/inc1
load_common bundle/git
load_common perl_dzil
load_common edit_perl_lib

base="$HOME/progs/perl/cpan/File/Find-Object"
ffo_trunk="$base/trunk"
module="$ffo_trunk"
bench="$base/benchmark"
berlios_base="$base/from-berlios"
git_base="$berlios_base"
berlios_trunk="$berlios_base/trunk"
ffor_trunk="$berlios_trunk"
rule_trunk="$berlios_trunk/File-Find-Object-Rule"
libfilefind="$berlios_trunk/libfilefind/c_glib_based"
rule_remote_repo="$(_shlomif_github "perl-file-find-object-rule")"
ffo_remote_repo="$(_shlomif_github "perl-file-find-object")"


this="$module"

setup()
{
    (
        mkdir -p "$git_base"
        cd "$git_base"
        git clone "$rule_remote_repo" "$ffor_trunk"
        mkdir -p "$base"
        cd "$base"
        git clone "$ffo_remote_repo" "$ffo_trunk"
    )
    cd "$this"
}
cd "$this"


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
