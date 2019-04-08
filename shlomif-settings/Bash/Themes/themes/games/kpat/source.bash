load_common bundle/git
load_common chdirs
load_common edit_perl_lib

base="$HOME/Download/unpack/kde/kdegames/git"
git_base="$base"
trunk="$base/kpat"
c_build="$base/b"
b="$c_build"
c="$trunk"
this="$c"

remote_repo="kde:kpat"

export FCS_USE_TEST_RUN=1 FCS_TEST_CLANG_FORMAT=1 FCS_TEST_BUILD=1

cd "$this"

t()
{
    (
    set -e -x
    mkdir -p "$b"
    cd "$b"
    cmake -DWITH_BH_SOLVER=1 -DCMAKE_BUILD_TYPE=Debug "$c"
    make
    make test
    )
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='kpat'
