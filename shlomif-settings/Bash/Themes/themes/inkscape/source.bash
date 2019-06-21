load_common chdirs
load_common bundle/git

. ~/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/Dev-Path-Configs-Source-Me.bash

remote_repo="$(_shlomif_gitlab "inkscape")"
ink="$HOME/Download/unpack/graphics/inkscape"
base="$ink"
_base_trunk="$ink/inkscape"
# _base_trunk="$ink/shlomif--trunk-refactoring"
trunk="$_base_trunk"
c_src="$_base_trunk"
this="$c_src"
build="$base/b"
# build="$base/B-refact"
b="$build"
c="$c_src"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$build=$build" \
        "\$trunk=$trunk" \
        "\$ink=$ink" \
        "~=$HOME"
}

conf()
{
    (
        mkdir -p "$build"
        cd "$build"
        rm -fr CMakeCache.txt CMakeFiles/
        bash ~/conf/build/inkscape-cmake.sh "$c"
    )
}

b()
{
    (
        cd "$build" && \
            ninja -j4 check && \
            ninja -j4 install \
            ; n --msg "Inkscape build finished"
    )
}

t()
{
    b
}

run()
{
    /home/shlomif/apps/graphics/inkscape-trunk/bin/inkscape "$@"
}
alias r='run'

# parallel-tests
pt()
{
    ( unset FCS_USE_TEST_RUN; t; )
}

f-()
{
    (
        cd "$trunk"
        ruby /home/shlomif/progs/freecell/git/fc-solve/fc-solve/scripts/find-ids.rb $( ack --sort -f --cpp --cc ) > ids.txt
    )
}

s-()
{
    (
        set -e -x
        git co master
        git s u
        git co refactoring
        git rebase master
    )
}

alias g='gvim ids.txt +cbuf +cope +"sp scripts/ids-whitelist.txt" +"sp scripts/ids-whitelist.txt"'

# Enable clang+ccache and a debug build.
export CC=$HOME/bin/clang CXX=$HOME/bin/clang++ DEBUG=1

proj_name='ink'
