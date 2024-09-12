# The MIT / Expat License
#
# Copyright (c) 2012, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

build_project()
{
    (
        if ! test -d "$build"
        then
            conf
        fi
        cd "$build" && \
            ninja -j4 install && \
            ninja -j4 check \
            ; n --msg "Inkscape build finished"
    )
}

b()
{
    build_project "$@"
}

t()
{
    build_project "$@"
}

run()
{
    $HOME/apps/graphics/inkscape-trunk/bin/inkscape "$@"
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
        ruby $HOME/progs/freecell/git/fc-solve/fc-solve/scripts/find-ids.rb $( ack --sort -f --cpp --cc ) > ids.txt
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

ninja()
{
    (
        for target in "$@"
        do
            if test "$target" = "test"
            then
                echo "Do not invoke 'ninja test'. Use 'check' instead" 1>&2
                exit -1
            fi
        done
        `which ninja` "$@"
    )
}

make()
{
    (
        for target in "$@"
        do
            if test "$target" = "test"
            then
                echo "Do not invoke 'make test'. Use 'check' instead" 1>&2
                exit -1
            fi
        done
        `which make` "$@"
    )
}

__vim_ids_args='ids.txt +cbuf +cope +"sp scripts/ids-whitelist.txt" +"sp scripts/ids-whitelist.txt"'
alias g="gvim $__vim_ids_args"
alias qv="qvim $__vim_ids_args"


# Enable clang+ccache and a debug build.
export CC=$HOME/bin/clang CXX=$HOME/bin/clang++ DEBUG=1

shlomif_ux()
{
    prefix=~/apps/graphics/inkscape-trunk/
    if false
    then
        PKG_CONFIG_PATH+=:"$prefix"/lib64/pkgconfig
        LIBRARY_PATH+=:"$prefix/lib64"
        dedup_pathvar LIBRARY_PATH
        dedup_pathvar PKG_CONFIG_PATH
        export LIBRARY_PATH PKG_CONFIG_PATH
    else
        unset CC
        unset CPATH
        unset CXX
        unset PKG_CONFIG_PATH
    fi

    conf_meson_dep()
    {
        (
        set -x
        meson setup --prefix "${prefix}" ..
        )
    }
}

shlomif_ux

proj_name='ink'
