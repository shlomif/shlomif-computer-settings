load_common bundle/git
load_common chdirs
load_common edit_perl_lib

base="$HOME/progs/games/black-hole-solitaire"
git_base="$base"
trunk="$base/trunk"
proj="$trunk/black-hole-solitaire"
module="$proj/Games-Solitaire-BlackHole-Solver"
c_src="$proj/c-solver"
c_build="$proj/B"
a_src="$c_src"
a_build="$c_build"
b="$c_build"
c="$c_src"

this="$c_src"

remote_repo="$(_shlomif_github "black-hole-solitaire")"

export FCS_USE_TEST_RUN=1 FCS_TEST_CLANG_FORMAT=1 FCS_TEST_BUILD=1
export SKIP_RINUTILS_INSTALL=1

cd "$this"

test_without_notify()
{
    (
    cd "$trunk"
    rm -fr black-hole-solitaire/B/
    rm -fr black-hole-solitaire/B_with_max_num_played/
    perl black-hole-solitaire/CI-testing/continuous-integration-testing.pl
    )
}

alias t='test_without_notify'
quick_test_without_build()
{
    (
        unset FCS_TEST_BUILD
        test_without_notify
    )
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

alias pt='test_without_notify'
alias m='make -j8'
alias fmt='quick_test_without_build'

install_deps()
{
    export LD_LIBRARY_PATH=~/apps/fcs/lib/
    (
        set -e -x
        pip install --upgrade --user pydistman tox
        ( cm && dzil authordeps --missing ) | xargs cpanm -q Math::Random::MT Test::Some
    )
}

proj_name='black-hole'
