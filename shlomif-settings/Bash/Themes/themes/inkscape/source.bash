load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

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
        bash ~/conf/build/inkscape-cmake.sh "$c"
    )
}

c()
{
    cd "$c"
}

cb()
{
    cd "$b"
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

f()
{
    (
        cd "$trunk"
        ruby /home/shlomif/progs/freecell/git/fc-solve/fc-solve/scripts/find-ids.rb $( ack --sort -f --cpp --cc ) > ids.txt
    )
}

alias g='gvim ids.txt +cbuf +cope +"sp scripts/ids-whitelist.txt" +"sp scripts/ids-whitelist.txt"'

proj_name='ink'
