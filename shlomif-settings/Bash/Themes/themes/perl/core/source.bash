# Commenting-out because I am getting:
# -bash: __git_ps1: command not found
# load_common git_term
load_common sys
load_common trim_pathes

disable_local_lib
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
        git remote add upstream 'https://github.com/Perl/perl5'
    )
    cd "$this"
}

_build_generic()
{
    local script="$1"
    shift

    _sys bash ~/conf/build/perl/"$script" && _sys make -j4
    _sys n --msg "perl/core build finished" || true
}

# Short for build.
_build_perl()
{
    _build_generic "perl-bleadperl.sh"
}

b()
{
    _build_perl "$@"
}

__debug_build()
{
    _build_generic "perl-bleadperl-debug.sh"
}

bd()
{
    __debug_build "$@"
}


# Short for build-with-threads-support
_build_threaded()
{
    _build_generic "perl-bleadperl-usethreads.sh"
}

bt()
{
    _build_threaded
}

# Short for test.
t()
{
    _test_perl
}

_test_perl()
{
    _sys make -j12 test_harness TEST_JOBS=4
    _sys n --msg "perl/core test finished" || true
}

test_debugger()
{
    _sys make -j12 test_harness TEST_FILES='../lib/perl5db.t'
}

td()
{
    test_debugger "$@"
}

install_perl()
{
    set -x
    _sys rm -fr ~/apps/perl/bleadperl
    _build_threaded && \
        _test_perl && \
    _sys make -j12 install && \
    (cd ~/apps/perl/bleadperl/bin ;
        #ext='5.35.4'
        ext="$(perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/largest-version.pl --dir "$PWD" --basename perl)"
        for fn in *$ext ; do
            ln -sf "$fn" "${fn%$ext}" ;
        done
    ) && \
    ~/apps/perl/bleadperl/bin/cpan -i App::cpanminus && \
    (
        cpanm_()
        {
            ~/apps/perl/bleadperl/bin/cpanm "$@"
        }
        cpanm_ -q Task::BeLike::SHLOMIF || \
            cpanm_ -vvvf HTML::TreeBuilder::LibXML && \
            cpanm_ -q Task::BeLike::SHLOMIF
    ) && \
    true
    set +x
}

i()
{
    install_perl "$@"
}

mi()
{
    install_perl "$@"
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
