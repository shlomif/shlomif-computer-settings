load_common mymake
load_common completion
# load_common gen_patch
load_common git

base="$HOME/progs/perl/www/Nav-Menu"
git_base="$base"
trunk="$base/trunk"
this="$trunk/module"
rw_repos_url="https://svn.berlios.de/svnroot/repos/web-cpan/nav-menu"
read_repos_url="http://svn.berlios.de/web-cpan/nav-menu"
test_dir="$trunk/tests/integration/sites-gen"

remote_repo="$(_shlomif_github "perl-HTML-Widgets-NavMenu")"

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

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

cd $this

