#
# perl_mb.bash
# Copyright (C) 2018 shlomif <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

__dist_name()
{
    (cd "$this" &&
        cat META.yml | perl -lnE 'say if s/^name: //'
    )
}

__version()
{
    (cd "$this" &&
        cat META.yml | perl -lnE 'say if s/^version: //'
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
