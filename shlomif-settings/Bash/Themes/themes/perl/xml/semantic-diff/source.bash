load_common mymake
load_common completion
load_common prompt
# load_common gen_patch

base="$HOME/progs/perl/cpan/XML/SemanticDiff"
trunk="$base/trunk"
module="$trunk/perl/modules/XML-SemanaticDiff"
this="$module"

# This is so "make dist" won't complain when the file already exists.
export GZIP="-f"

cd "$this"

diff_remote_to_local()
{
    svk diff //mirror/XML-RSS/trunk //local/XML-RSS/local-trunk
}

__test_coverage()
{
    (
        cd "$this"
        rm -fr cover_db.old
        mv cover_db cover_db.old
        cover -delete
        HARNESS_PERL_SWITCHES="-MDevel::Cover" make runtest
        cover
    )
}

__update_main_file_test_coverage()
{
    (
        cd "$this"
        rm -fr cover_db.old
        cp -a cover_db cover_db.old
        HARNESS_PERL_SWITCHES="-MDevel::Cover" runprove --blib t/items-are-0.t
        cover
    )
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "

