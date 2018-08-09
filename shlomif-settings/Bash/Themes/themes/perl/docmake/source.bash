load_common mymake
load_common completion
load_common prompt
load_common hg
load_common perl_dzil
load_common perl_system_tests

base="$HOME/progs/perl/cpan/App/Docmake"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/modules/App-XML-DocBook-Docmake"
this="$module"
test_dir="$HOME/Docs/Svn/Docs/programming/The-Perfect-IT-Workplace/docbook"
remote_repo="$(_shlomif_bitbucket "docmake")"

__rerun_coverage()
{
    (
        cd "$this"
        cover -delete
        HARNESS_PERL_SWITCHES=-MDevel::Cover make test
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

proj_name='docmake'

cd "$this"
