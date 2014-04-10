# Commenting-out because I am getting:
# -bash: __git_ps1: command not found
# load_common git_term
load_common sys

p5_base="$HOME/Download/unpack/perl/p5"
this="$p5_base/git/perl"

cd "$this"

function edit {
    if [ ! -e "$1.orig" ] ; then
        cp "$1" "$1.orig"
    fi
    gvim -f "$1"
}

function unedit {
if [ -L "$1".orig ]; then
    rm "$1"
    mv "$1".orig "$1"
fi
}

mkpatchorig() {
    local diffopts
    for f in `find . -name '*.orig' | sed s,^\./,,`
    do
        case `echo $f | sed 's,.orig$,,;s,.*\.,,'` in
            c)   diffopts=-p ;;
            pod) diffopts='-F^=' ;;
            *)   diffopts= ;;
        esac
        diff -du $diffopts $f `echo $f | sed 's,.orig$,,'`
    done
}

_build_generic()
{
    script="$1"
    shift

    _sys bash ~/conf/build/perl/"$script" && _sys make -j4
    _sys finish-client --msg "perl/core build finished"
}

# Short for build.
b()
{
    _build_generic "perl-bleadperl.sh"
}

# Short for build-with-threads-support
bt()
{
    _build_generic "perl-bleadperl-usethreads.sh"
}

# Short for test.
t()
{
    _sys make -j12 test_harness TEST_JOBS=4
    _sys finish-client --msg "perl/core test finished"
}

# Short for test debugger.
td()
{
    _sys make -j12 test_harness TEST_FILES='../lib/perl5db.t'
}

emcc_script_dir="$HOME/Download/unpack/perl/p5/emcc-build/perl-emcc-build"
emcc_script="$emcc_script_dir/BUILD_PERL_WITH_EMCC.bash"

emcc_conf()
{
    (
        cd "$this"
        _sys git clean -dxf
        _sys bash "$emcc_script"
        _sys finish-client --msg "perl/core emcc_conf finished"
    )
}

e()
{
    (
        gvim "$emcc_script"
    )
}

e_b()
{
    emcc_conf
}

PS1="\\u[perl/core]:\\w\\$ "

export PATH="$emcc_script_dir:$PATH"
