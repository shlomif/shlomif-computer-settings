# Commenting-out because I am getting:
# -bash: __git_ps1: command not found
# load_common git_term
load_common sys
load_common trim_pathes

# Too long $PATH is causing a lib/perlbug.t test failure
trim_pathes

p5_base="$HOME/Download/unpack/perl/p5"
_base_trunk="$p5_base/git"
trunk="$_base_trunk/perl"
this="$trunk"

cd "$this"

setup()
{
    (
        mkdir -p "$_base_trunk"
        cd "$_base_trunk"
        git clone 'https://github.com/shlomif/perl5' "$trunk"
        cd "$trunk"
        git remote add upstream 'git://perl5.git.perl.org/perl.git'
    )
    cd "$this"
}

_build_generic()
{
    local script="$1"
    shift

    _sys bash ~/conf/build/perl/"$script" && _sys make -j4
    _sys n --msg "perl/core build finished"
}

# Short for build.
b()
{
    _build_generic "perl-bleadperl.sh"
}

bd()
{
    _build_generic "perl-bleadperl-debug.sh"
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
    _sys n --msg "perl/core test finished"
}

# Short for test debugger.
td()
{
    _sys make -j12 test_harness TEST_FILES='../lib/perl5db.t'
}

install_perl()
{
    _sys make -j12 install
    (cd ~/apps/perl/bleadperl/bin ;
        ext='5.20.0'
        for fn in *$ext ; do
            ln -s "$fn" "${fn%$ext}" ;
        done
    )
}

emcc_script_dir="$HOME/Download/unpack/perl/p5/emcc-build/perl-emcc-build"
emcc_script="$emcc_script_dir/BUILD_PERL_WITH_EMCC.bash"

emcc_conf()
{
    (
        cd "$this"
        _sys git clean -dxf
        _sys bash "$emcc_script"
        _sys n --msg "perl/core emcc_conf finished"
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

proj_name='perl/core'

export PATH="$emcc_script_dir:$PATH"
