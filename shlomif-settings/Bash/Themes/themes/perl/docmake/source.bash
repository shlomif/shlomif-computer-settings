load_common mymake
load_common completion
load_common prompt
load_common hg
load_common perl_dzil
# load_common gen_patch

base="$HOME/progs/perl/cpan/App/Docmake"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/modules/App-XML-DocBook-Docmake"
this="$module"
test_dir="$HOME/Docs/Svn/Docs/programming/The-Perfect-IT-Workplace/docbook"
remote_repo="$(_shlomif_bitbucket "docmake")"
# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__run_integration_tests()
{
    (
        touch "$test_dir"/head.pl ;
        __display_integration_tests_results ;
    )
}

__display_integration_tests_results()
{
    (
        cd "$test_dir" ;
        make ;
    )
}

__rerun_coverage()
{
    (
        cd "$this"
        cover -delete
        HARNESS_PERL_SWITCHES=-MDevel::Cover make test
        cover
    )
}

cd $this

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='docmake'
