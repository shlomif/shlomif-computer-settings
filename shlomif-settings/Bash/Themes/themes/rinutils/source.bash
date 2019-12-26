load_common bundle/git
load_common chdirs
load_common edit_perl_lib

base="$HOME/progs/C/rinutils"
hg_base="$base"
trunk="$base"
proj="$trunk"
c_src="$proj"
c_build="$proj/B"
a_src="$c_src"
a_build="$c_build"
b="$c_build"
c="$c_src"

this="$c_src"

remote_repo="$(_shlomif_github "rinutils")"

export FCS_USE_TEST_RUN=1 FCS_TEST_CLANG_FORMAT=1 FCS_TEST_BUILD=1

cd "$this"

__run_tests()
{
    (
    cd "$trunk"
    rm -fr B/
    perl CI-testing/continuous-integration-testing.pl
    )
}

fmt()
{
    (
        unset FCS_TEST_BUILD
        __run_tests
    )
}

t()
{
    __run_tests "$@"
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$c_src=$c_src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

cm()
{
    cd "$module"
}

alias pt='__run_tests'
alias m='make -j8'

proj_name='rinutils'
