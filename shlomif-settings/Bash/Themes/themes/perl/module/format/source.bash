load_common mymake
load_common completion

cpan_base="$HOME/progs/perl/cpan"
repos="$cpan_base/hg"
base="$repos/Module-Format/Module-Format"
trunk="$base"
this="$trunk"
rw_repos_url="ssh://hg@bitbucket.org/shlomif/web-cpan"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

setup()
{
    (
        mkdir -p "$cpan_base"
        cd "$cpan_base"
        hg clone "$rw_repos_url" hg
    )
}

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

t()
{
    (cd "$this" ; ./Build runtest)
}

dt()
{
    (cd "$this" ; ./Build distruntest)
}

cd $this

