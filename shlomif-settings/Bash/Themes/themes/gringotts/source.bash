load_common completion
load_common mymake

base="$HOME/progs/C/gringotts"
_base_trunk="$base"
trunk="$base/gringotts"
c_src="$trunk/c-src"
build_dir="$trunk/B"
build="$build_dir"
this="$build_dir"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'git@github.com:shlomif/gringotts.git' "$trunk"
    )
    mkdir -p "$this"
    cd "$this"
}

conf()
{
    (
        set -e -x
        mkdir -p "$build"
        cd "$build"
        rm -fr CMakeCache.txt CMakeFiles/
        bash ~/conf/build/gringotts.sh "$c_src"
    )
}

b()
{
    (
        cd "$build" && \
            ninja -j4 install \
            ; n --msg "gringotts build finished"
    )
}
cd $this
