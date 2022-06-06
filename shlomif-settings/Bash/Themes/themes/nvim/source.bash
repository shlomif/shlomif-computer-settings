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

ruby ~/conf/trunk/shlomif-settings/home-bin-executables/bin/rubygem-query-neovim.rb

__qtnvim_make_install()
{
    (
        set -e -x
        mkdir -p "$qb"
        cd "$qb"
        bash -x ~/conf/build/neovim-qt.sh "$qtrunk"
        make
        make install
    )
}

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

__nvim_make_install()
{
    (
    set -e -x
    cd "$trunk"
    which libtool
    make distclean
    if false
    then
        CMAKE_GENERATOR="Unix Makefiles" make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/apps/neovim" BUILD_TOOL="make" # "ninja -j1"
    fi
    make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/apps/neovim"
    make install
    )
}

mi()
{
    __nvim_make_install "$@"
}

prompt()
{
    __prompt_cmd \
        "\$c_src=$c_src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

__git_update_with_tags()
{
    git pull --ff-only upstream master --tags --force || true
    git s u || true
}

update_all()
{
    (
        set -e -x
        cd "$trunk"
        ( git remote add upstream https://github.com/neovim/neovim.git || true)
        __git_update_with_tags
        __nvim_make_install
        cd "$qtrunk"
        ( git remote add upstream https://github.com/equalsraf/neovim-qt.git || true)
        __git_update_with_tags
        __qtnvim_make_install
    )
}

__allow_update_all_to_pass()
{
    unset MAKEFLAGS
}

__allow_update_all_to_pass

proj_name='neovim'
