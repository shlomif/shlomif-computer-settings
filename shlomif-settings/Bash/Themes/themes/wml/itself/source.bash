load_common bundle/git
load_common chdirs

export MAKEFLAGS='-j100'
base="$HOME/progs/wml/wml-itself"
core="$base/core"
git_base="$core"
trunk="$core/trunk"
src="$trunk/src"
# this="$trunk/wml_backend/p2_mp4h"
# this="$trunk/wml_backend/p3_eperl"
# this="$trunk/src/wml_backend"
b="$trunk/B"
this="$b"

remote_repo="$(_thewml_github "website-meta-language")"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$core=$core" \
        "\$base=$base" \
        "~=$HOME"
}

e()
{
    (cd "$this" ;
        gvim -p \
            ../src/wml_include/WML_Frontends/Wml/Runner.pm \
            ../src/wml_include/WML_Backends/IPP/Main.pm \

    )
}

t()
{
    (
        mkdir -p "$b"
        cd "$b"
        rm -fr tests/
        perl "$src"/wml_test/run_test.pl
    )
}

b()
{
    mkdir -p "$b"
    cd "$b"
    cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/test/wml" "$src" && \
        make -j4 && \
        make install
}

fmt()
{
    (
        unset WML_TEST_BUILD
        t
    )
}

c()
{
    cd "$src"
}

alias p='git push'

proj_name='wml'
export WML_TEST_BUILD=1 WML_TEST_TIDY=1
export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/wml-itself-tidyall.d"

PATH="$HOME/apps/test/wml/bin/:$PATH"
