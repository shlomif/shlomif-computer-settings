# Commenting-out because I am getting:
# -bash: __git_ps1: command not found
# load_common git_term
load_common sys
load_common trim_pathes

disable_local_lib
# Too long $PATH is causing a lib/perlbug.t test failure
trim_pathes

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
        git remote add upstream 'https://github.com/Perl/perl5'
    )
    cd "$this"
}

_build_generic()
{
    local script="$1"
    shift

    _sys bash ~/conf/build/"${script}" && _sys make -j4
    _sys n --msg "perl/core build finished" || true
}

# Short for build.
_build_py()
{
    _build_generic "python3-dist.bash"
}

b()
{
    _build_py "$@"
}

_test()
{
    (
    set -e -x
    _build_py "$@"
    make test
    )
}

t()
{
    _test "$@"
}

proj_name='py/core'
