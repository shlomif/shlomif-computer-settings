load_common bundle/git
load_common chdirs
load_common edit_perl_lib

base="$HOME/Download/unpack/file/vim/neovim"
hg_base="$base"
trunk="$base"
proj="$trunk/black-hole-solitaire"
module="$proj/Games-Solitaire-BlackHole-Solver"
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

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$c_src=$c_src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='neovim'