# Commenting-out because I am getting:
# -bash: __git_ps1: command not found
# load_common git_term
load_common sys
load_common trim_pathes

trim_pathes
if true
then
    enable_local_lib
fi

py_base="$HOME/Download/unpack/prog/python"
_base_trunk="$py_base"
trunk="$_base_trunk/cpython"
this="$trunk"

cd "$this"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'https://github.com/shlomif/cpython' "$trunk"
        cd "$trunk"
        git remote add upstream 'https://github.com/python/cpython.git'
    )
    cd "$this"
}

_build_generic()
{
    local script="$1"
    shift

    git s u main
    _sys bash ~/conf/build/"${script}" && _sys make -j4
    _sys n --msg "python/core build finished" || true
}

_build_py()
{
    _build_generic "python3-dist.bash"
}

# Short for build.
b()
{
    _build_py "$@"
}

_test()
{
    (
    set -e -x
    _build_py "$@"
    (
    export DISPLAY=":1.0"
    make test
    )
    )
}

t()
{
    _test "$@"
}

i()
{
    _test "$@"
}

proj_name='py/core'
