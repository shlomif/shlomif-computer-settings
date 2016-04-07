load_common mymake
load_common completion
load_common prompt
load_common hg
# load_common gen_patch

base="$HOME/progs/perl/cpan/App/Docmake"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/modules/App-XML-DocBook-Docmake"
this="$module"
test_dir="$HOME/Docs/Svn/Docs/programming/The-Perfect-IT-Workplace/docbook"
remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="docmake")"
# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__dist_name()
{
    (cd "$this" &&
        cat META.yml | grep "^name:" | sed 's/^name: //'
    )
}

__version()
{
    (cd "$this" &&
        cat META.yml | grep "^version:" | sed 's/^version: //'
    )
}

__test_distribution()
{
    (
        cd "$this"
        ./Build disttest
        rm -fr "$(__dist_name)-$(__version)"
    )
}

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

__run_build_tests()
{
    (
        cd "$trunk/tests/build/EU-MM/" ;
        ./test.sh ;
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

