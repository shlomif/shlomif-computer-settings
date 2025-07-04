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
proj_name='fcs'

load_common bundle/git
load_common chdirs
load_common partests

_enable_git_info_prompt="always"

remote_repo="$(_shlomif_github "fc-solve")"
remote_repo_of_assets="$(_shlomif_github "fc-solve-site-assets")"
pristine_copy=~/Backup/Arcs/fcs-site--post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/fcs-site--post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/fcs-site--post-dest/this-incs-reduced
_post_dest="dest"
fcs="$HOME/progs/freecell"
base="$fcs"
branches="$fcs/branches"
git_base="$fcs/git"
ca="$git_base/pysol-cards/pysol_cards"
trunk="$git_base/fc-solve"
t_fcs="$trunk/fc-solve"
c_src="$t_fcs/source"
c="$c_src"
build_dir_path="$t_fcs/B"
b="${build_dir_path}"
fmt_tests_build_dir="$t_fcs/b-test_using_formatting_tests"
o="$t_fcs/scripts/TEST_OPTIMIZATIONS"
i="$trunk/../ids-whitelist/"
site="$t_fcs/site/wml"
latemp_trunk="$site"
load_common latemp
blog="$t_fcs/site/blog"
presets="$t_fcs/presets/soft-threads/meta-moves/auto-gen"
atomic_presets="$t_fcs/presets/soft-threads/atomic-moves/auto-gen"
cpan="$trunk/cpan"
verify="$cpan/Games-Solitaire-Verify/Games-Solitaire-Verify"
bench="$t_fcs/benchmarks"
test_dir="$branches/trunk/testing/source"
dd_branch="$branches/depth-dependent-moves-order/source"
parallel="$t_fcs/scripts/parallel-solve-and-verify-for-bakers-game"
arcs_git="$base/Arcs/fc-solve-site-assets"
arcs="$arcs_git/fc-solve-site-assets"

ai_path="$cpan/AI-Pathfinding-OptimizeMultiple"
ai_path_sys_tests="$cpan/temp-AI-Pathfinding-OptimizeMultiple-system-tests"

# patsolve
git_pats="$c_src/patsolve"
pats="$git_pats/patsolve"
pats_b="$git_pats/b"

this="$c_src"
# this="$dd_branch"

export PERL_INLINE_DIRECTORY="${TMPDIR:-/tmp}/${proj_name}-perl-Inline"
mkdir -p "$PERL_INLINE_DIRECTORY"
export LIBAVL2_SOURCE_DIR="$HOME/Download/unpack/prog/c/avl-2.0.3"
export PAGER='less'
export FCS_USE_TEST_RUN=1
export FCS_PGO_THEME="-l lg" FCS_TEST_CLANG_FORMAT=1

if ! test -e "$LIBAVL2_SOURCE_DIR"
then
    (
    set -e -x
    containing_dn="$(dirname "$LIBAVL2_SOURCE_DIR")"
    mkdir -p "${containing_dn}"
    cd "${containing_dn}"
    wget https://ftp.gnu.org/pub/gnu/avl/avl-2.0.3.tar.gz
    tar -xvf avl-2.0.3.tar.gz
    find "$LIBAVL2_SOURCE_DIR" -type f | xargs perl -i -lpE 's/[\t ]+$//'
    )
fi

# This causes problems with the threaded solver.
unset MALLOC_CHECK_

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$pats=$pats" \
        "\$git_pats=$git_pats" \
        "\$verify=$verify" \
        "\$parallel=$parallel" \
        "\$presets=$presets" \
        "\$atomic_presets=$atomic_presets" \
        "\$trunk=$trunk" \
        "\$fcs=$fcs" \
        "~=$HOME"
}

find_ids()
{
    (
        cd "$c_src"
        local cmd='ruby ../scripts/find-ids.rb *.[ch] */*.[ch] patsolve/patsolve/*.[ch] > ids.txt'
        echo "$cmd"
        eval "$cmd"
    )
}

clean_patsolve_build_dir()
{
    rm -fr "$pats_b"
}

_configure_build()
{
    (

    set -e -x

    if ! test -e "${build_dir_path}"
    then
        mkdir "${build_dir_path}"
    fi

    cd "${build_dir_path}"

    if ! test -e CMakeCache.txt
    then
        "$c_src"/../scripts/Tatzer ${args}
    fi

    )
}

conf()
{
    _configure_build "$@"
}

test_without_notify()
{
    (
        export HARNESS_BREAK=1
        set -e -x
        clean_patsolve_build_dir
        build_dir_path="$t_fcs/B-test_without_notify"
        export FCS_BIN_PATH="${build_dir_path}" FCS_SRC_PATH="$c_src"
        export FCS_PATH="${FCS_BIN_PATH}"
        _configure_build
        cd "${build_dir_path}" && \
            make -j4 && \
            perl "$c_src"/run-tests.pl
    )
}

test_with_notify()
{
    (
        test_without_notify
        n --msg "Freecell Solver Test Finished"
    )
}

t()
{
    test_with_notify "$@"
}

# parallel-tests
run_tests_in_parallel()
{
    (
        unset FCS_USE_TEST_RUN;
        test_with_notify
    )
}

pt()
{
    run_tests_in_parallel "$@"
}

make()
{
    if [ "$*" = "pgo" ]; then
        `which gmake` VERBOSE=1 "$@"
    else
        `which gmake` "$@"
    fi
}

_dzil_inst()
{
    (
        cd "$ai_path" && \
            dzil test --release && \
            dzil install --install-command='bash ~/conf/build/perl/install-to-apps-perl-modules.sh'
    )
}

_Makefile_gnu__make()
{
    gmake -f "$t_fcs"/scripts/Makefile.gnu SRC_DIR="$c_src" -j4 "$@"
}

# Short for make
M()
{
    _Makefile_gnu__make clean
    _Makefile_gnu__make all
}

# Short for "profile"
p-()
{
    local out_fn="$1"
    shift
    _Makefile_gnu__make clean
    _Makefile_gnu__make PROFILE=2 all
    local exe='./freecell-solver-multi-thread-solve' prof=/tmp/profile
    CPUPROFILE="$prof" "$exe" 1 32000 4000 $FCS_PGO_THEME
    echo top10000 | pprof "$exe" "$prof" | tee -a "$out_fn"
}

__cd_site()
{
    cd "$site"
}

cs()
{
    __cd_site "$@"
}

i()
{
    cd "$i"
}

cdp()
{
    cd "$pats"
}

pb()
{
    cd "$pats_b"
}

test_using_formatting_tests()
{
    (
        unset FCS_USE_TEST_RUN
        clean_patsolve_build_dir
        mkdir -p "$fmt_tests_build_dir" && \
        cd "$fmt_tests_build_dir" && \
            "$c_src"/../scripts/Tatzer && \
            make -j4 && \
            perl "$c_src"/run-tests.pl --glob='{clang-format,tidy,py-flake8,style-trailing-space,verify--nht}*.t' && \
            cd .. && \
            rm -fr "$fmt_tests_build_dir" && \
            true
    )
}

alias fmt=test_using_formatting_tests

bpat()
{
    (
    mkdir -p "$pats_b"
    pb
    cmake "$pats" && make -j4 && make check # && rm -fr "$pats_b" && rm -f "$pats/cmake"/*.cmake
    )
}

bp()
{
    bpat
}

ti1()
{
    perl "$c_src"/../scripts/time-fcs.pl DUMPS-*/*
}

ti()
{
     ti1 | tac | cat -n | perl -lapE 's/:/\t/g; ' | $PAGER
}

alias g='gvim ids.txt +cbuf +cope +"sp scripts/ids-whitelist.txt" +"sp scripts/ids-whitelist.txt"' f=find_ids
ca()
{
    cat ids.txt | perl -lapE 's#.*:##' | sort | uniq -c | sort -n | perl -lanE 'print $F[0]' | sort | uniq -c | sort -n -k 2 | $PAGER
}
m()
{
    make -j100 "$@"
}

alias k='pkill -USR1 fc-solve'

_display_post_processor()
{
    tac | cat -n | perl -lapE 's/:/\t/g; ' | $PAGER
}

_display_generic()
{
    perl ../scripts/time-fcs.pl "$@" | _display_post_processor
}

_display_default_dump_files()
{
    _display_generic DUMPS-*/*
}

disp()
{
    _display_default_dump_files
}

disp-all()
{
    _display_generic DUMPS-*/* ~/Backup/Arcs/fc-solve/old-dumps/DUMPS-*/*
}

tot2()
{
    set -x
    perl ../scripts/gen-obf-mod-1.pl > t.sh
    FCS_PGO_THEME="--read-from-file 4,$(pwd)/t.sh" sudo "$HOME"/bin/sudo_bench_fcs
    _display_default_dump_files
    set +x
}

run_total_build_and_benchmark_process()
{
    set -x
    perl ../scripts/cmd-line-compiler compile
    make
    y
    set +x
}

tot()
{
    run_total_build_and_benchmark_process "$@"
}

y()
{
    sudo "$HOME"/bin/sudo_bench_fcs
    _display_default_dump_files
}

unalias z zz || true

zz()
{
    (
        c
        cd ../0fc-b
        find results/ -regextype egrep -regex 'results/[0-9]+' -print | xargs grep -L End | xargs rm -f
    )
}

z()
{
    c
    cd ../0fc-b
    zz
    bash ../scripts/0fcpar.bash
}

# delta states test
delta()
{
    (
        set -x
        set -e
        cb
        ../scripts/Tatzer -l n2t
        test_using_formatting_tests
        run_tests_in_parallel
        cmake -DFCS_DISABLE_DEBONDT_DELTA_STATES=1 ../source/
        test_using_formatting_tests
        run_tests_in_parallel
    )
}

ts()
{
    __test_site "$@"
}

# test site
__test_site()
{
    (
        __cd_site
        make test
    )
}

cv()
{
    cd "$verify"
}

_reprb_diff_builds()
{
    (
        set -e -x
        _reprb_gen_build_sum 1
        _reprb_gen_build_sum 2
        cd "$reprb_dir"
        if cmp -s ../1.txt ../2.txt
        then
            true
        else
            diff -u ../1.txt ../2.txt > ../repr-build.diff
            echo "Reproducible build failed with args=$args !" 1>&2
            exit 1
        fi
    )
}
reprb_dir="$c_src/../reproducible-build-dir"

_reprb_view_diffs()
{
    cd "$reprb_dir"
    gvimdiff ../1.txt ../2.txt
}

_reprb_gen_build_sum()
{
    local id="$1"
    shift
    (
        cd "$c_src"/..
        set -e -x
        rm -fr "$reprb_dir"
        mkdir -p "$reprb_dir"
        cd "$reprb_dir"
        "$c_src"/../scripts/Tatzer ${args}
        perl "$c_src"/../scripts/cmd-line-compiler compile
        m
        rm -f ./CMakeFiles/CMakeError.log
        rm -f ./CMakeFiles/CMakeOutput.log
        rm -f ./_Inline/build/FC_Solve/SplitCmdLine/Makefile.PL
        rm -f ./_Inline/lib/auto/FC_Solve/SplitCmdLine/SplitCmdLine.inl
        ~/progs/rshasum/rshasum.bash > "../$id.txt"
        cd "$c_src"/..
        rm -fr "$reprb_dir-$id"
        cp -a "$reprb_dir" "$reprb_dir-$id"
    )
}

reprb()
{
    alias f='_reprb_gen_build_sum'
    alias g='_reprb_diff_builds'
    alias v='_reprb_view_diffs'
}

gentags()
{
    ctags {$c_src,$pats}/**/*.[ch] $c_src/**/*.{pl,pm,t}
}

setup_arcs_dir()
{
    mkdir -p "$(dirname "$arcs_git")"
    git clone "$remote_repo_of_assets" "$arcs_git"
}

total_tests()
{
    (
        set -e -x
#        perl -E "use Path::Tiny qw/path/ ; die qq%remaining build directories% if path(shift(@ARGV))->parent()->children(qr/\\Abuild-[0-9]+\\z/)" "$c_src"
        cd "$c_src"
        perl ../scripts/multi_config_tests.pl --only-check-ready
        (cd "$site" && git clean -dxf . && bash -x bin/install-npm-deps.sh ) || true
        test_using_formatting_tests
        (
            unset FCS_USE_TEST_RUN
            test_without_notify
        )
        if test "$fcs_skip_build_tests" = '0'
        then
            (export FCS_TEST_BUILD=1 ; test_without_notify)
        fi
        cd "$c_src"
        perl ../scripts/multi_config_tests.pl
    )
    notifier notify --msg "fc-solve testing"
}

tt()
{
    total_tests "$@"
}

partial_rebuild()
{
    (
        set -e -x
        cd "$site"
        touch bin/jinja-render.py
        touch bin/tt-render.pl
        gmake fastrender
        __test_site
    )
}

-p()
{
    partial_rebuild
}

export FCS_BIN_PATH="${build_dir_path}" FCS_SRC_PATH="$c_src"
export FCS_PATH="${FCS_BIN_PATH}"
export PERL5LIB="${PERL5LIB}:${FCS_SRC_PATH}/t/lib"
export HTML_VALID_VNU_JAR=~/Download/unpack/net/www/validator/build/dist/vnu.jar
# Causes rpmbuild to fail.
if true
then
    export REPRODUCIBLE_BUILDS=1
    slightly_wrong_gcc_flag_see_man_gcc="-frandom-seed=1977";
    export CFLAGS="$slightly_wrong_gcc_flag_see_man_gcc"
fi
PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$PATH:$site/node_modules/.bin:$HOME/apps/hypermail/bin"
# Temporary measure because valgrind-3.7.0 on mageia v7 does not handle
# the new glibc well so we need to use the one from git master HEAD.
PATH="$HOME/apps/valgrind/bin:$PATH"
CPATH+=":/opt/vlc-3.0/libtap/include/"
LIBRARY_PATH+=":/opt/vlc-3.0/libtap/lib/"
export CPATH LIBRARY_PATH CMAKE_LIBRARY_PATH="$LIBRARY_PATH" LD_LIBRARY_PATH="$LIBRARY_PATH"
fcs_skip_build_tests=0

debian_ux()
{
    export DOCBOOK5_XSL_STYLESHEETS_PATH=/usr/share/sgml/docbook/stylesheet/xsl/docbook-xsl DBTOEPUB=/usr/bin/dbtoepub
    PATH+=:~/apps/test/bin:~/perl5/bin/
    export SKIP_SPELL_CHECK=1
    fcs_skip_build_tests=1
}

if test -e /etc/debian_version
then
    debian_ux
fi

shlomif_ux()
{
    set -x
    local _npm="1"
    if test $# -gt 0
    then
        local _p="$1"
        shift
        if test "$_p" = "--no-npm"
        then
            _npm="0"
        else
            printf "Unknown flag '%s'!\\n" "${_p}"
            return 1
        fi
    fi


    . ~/bin/Dev-Path-Configs-Source-Me.bash
    emsdk install tot
    emsdk activate tot --skip-npm
    export CFLAGS="-fuse-ld=mold"
    PATH+=:~/apps/mold-linker/bin
    __cd_site
    if test "$_npm" = "1"
    then
        if false
        then
            ncu --upgrade
        else
            printf "%s\n" "Run ncu without the \"--upgrade\" flag because eslint-typescript requires eslint version *8* (not 9)""
            "
            ncu
        fi
        npm install
    fi
    set +x
}

# Clean up the environment for the valgrind tests to succeed.
# Commented out because now it makes things worse in t/t/build-process.t
# file.
# unset WD BROWSER CANBERRA_DRIVER CMAKE_MODULE_PATH DESKTOP_SESSION EDITOR G_FILENAME_ENCODING G_SLICE HARNESS_SUMMARY_COL_FAIL HARNESS_SUMMARY_COL_SUC HGEDITOR H HOMEPAGE_SSH_PATH LADSPA_PATH LAN LANGUAGE LC_ADDRESS LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MESSAGES LC_MESSAGES LC_MESSAGES LC_NAME LC_NUMERIC LC_PAPER LC_SOURCES LC_TELEPHONE LC_TIME LESSCHARSET MAIL MANPATH MALLOC_PERTURB_ META_CLASS MGA_MENU_STYLE MYVIMRC NLSPATH NOPASTE_SERVICES PERL_AUTOINSTALL PERL_MM_USE_DEFAULT PILOTPORT PYTHONDONTWRITEBYTECODE PYTHONSTARTUP QT4DOCDIR QTDIR QTINC QTLIB QT_XFT SAL_USE_VCLPLUGIN SCREENDIR SVN_EDITOR SYSTEMD_PAGER VIM VIMRUNTIME WD XDG_CURRENT_DESKTOP XDG_MENU_PREFIX _LXSESSION_PID

# export LC_ALL=en_US.UTF-8
