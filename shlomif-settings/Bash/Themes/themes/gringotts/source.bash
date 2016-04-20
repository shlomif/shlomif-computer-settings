load_common completion
load_common mymake

base="$HOME/progs/C/gringotts"
_base_trunk="$base"
trunk="$base/gringotts"
c_src="$trunk/c-src"
build_dir="$trunk/B"
this="$build_dir"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'git@github.com:shlomif/gringotts.git' "$trunk"
    )
    cd "$this"
}

cd $this

