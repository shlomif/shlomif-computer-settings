load_common bundle/git
load_common chdirs
load_common edit_perl_lib

base="$HOME/Download/unpack/file/vim"
git_base="$base"
trunk="$base/neovim"
qtrunk="$base/neovim-qt"
qb="$base/b-neovim-qt"
c_src="$proj/c-solver"
c_build="$c_src/B"
a_src="$c_src"
a_build="$c_build"
b="$c_build"
c="$c_src"

this="$base"

remote_repo="$(_shlomif_github "neovim")"

export FCS_USE_TEST_RUN=1 FCS_TEST_CLANG_FORMAT=1

cd "$this"

qtb()
{
    (
        set -e -x
        mkdir -p "$qb"
        cd "$qb"
        bash -x ~/conf/build/neovim-qt.sh "$qtrunk"
        make
        make test
        make install
    )
}

t()
{
    (
    set -e -x
    cd "$trunk"
    make distclean
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/apps/neovim"
    make test
    )
}

mi()
{
    (
    set -e -x
    cd "$trunk"
    make distclean
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/apps/neovim"
    make install
    )
}

prompt()
{
    __prompt_cmd \
        "\$c_src=$c_src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='neovim'
