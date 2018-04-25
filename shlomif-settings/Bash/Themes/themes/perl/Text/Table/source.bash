load_common mymake
load_common completion
load_common prompt
load_common git

cpan_base="$HOME/progs/perl/cpan"
base="$cpan_base/Text/Table"
git_base="$base"
trunk="$base/git"
module="$trunk/Text-Table"
this="$module"
remote_repo="$(_shlomif_github "Text-Table")"

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
        cd "$module/tests/build/EU-MM/" ;
        ./test.sh ;
    )
}

t()
{
    (cd "$this" ; ./Build runtest)
}

dt()
{
    (cd "$this" ; ./Build distruntest)
}

cd $this

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Text-Table'
