load_common bundle/git
load_common chdirs
load_common partests

remote_repo="$(_shlomif_github "fc-solve")"
fcs="$HOME/progs/freecell"
base="$fcs"
branches="$fcs/branches"
git_base="$fcs/git"
trunk="$git_base/fc-solve"
t_fcs="$trunk/fc-solve"
c_src="$t_fcs/source"
c="$c_src"
b="$t_fcs/B"
o="$t_fcs/scripts/TEST_OPTIMIZATIONS"
i="$trunk/../ids-whitelist/"
site="$t_fcs/site/wml"
blog="$t_fcs/site/blog"
presets="$t_fcs/presets/soft-threads/meta-moves/auto-gen"
atomic_presets="$t_fcs/presets/soft-threads/atomic-moves/auto-gen"
cpan="$trunk/cpan"
verify="$cpan/Games-Solitaire-Verify/Games-Solitaire-Verify"
bench="$t_fcs/benchmarks"
test_dir="$branches/trunk/testing/source"
dd_branch="$branches/depth-dependent-moves-order/source"
parallel="$t_fcs/scripts/parallel-solve-and-verify-for-bakers-game"
arcs="$base/Arcs/fc-solve-site-assets/fc-solve-site-assets"

ai_path="$cpan/AI-Pathfinding-OptimizeMultiple"
ai_path_sys_tests="$cpan/temp-AI-Pathfinding-OptimizeMultiple-system-tests"

# patsolve
git_pats="$c_src/patsolve"
pats="$git_pats/patsolve"
pats_b="$git_pats/b"

this="$c_src"
# this="$dd_branch"

export LIBAVL2_SOURCE_DIR="$HOME/Download/unpack/prog/c/avl-2.0.3/"
export PAGER='less'
export FCS_USE_TEST_RUN=1
export FCS_PGO_THEME="-l lg" FCS_TEST_CLANG_FORMAT=1

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
clean_bpat()
{
    rm -fr "$pats_b"
}

tes()
{
    (
        export HARNESS_BREAK=1
        clean_bpat
        cd "$t_fcs/B" && \
            make -j4 && \
            perl "$c_src"/run-tests.pl
        n --msg "Freecell Solver Test Finished"
    )
}
alias t='tes'

# parallel-tests
pt()
{
    ( unset FCS_USE_TEST_RUN; t; )
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

cs()
{
    cd "$site"
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

# Short for format.
fmt()
{
    (
        unset FCS_USE_TEST_RUN;
        clean_bpat
        cd "$t_fcs/B" && \
            make -j4 && \
            perl "$c_src"/run-tests.pl --glob='{clang-format,tidy,py-flake8,style-trailing-space}*.t'
    )
}

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

disp()
{
    _display_generic DUMPS-*/*
}

disp-all()
{
    _display_generic DUMPS-*/* ~/Backup/Arcs/fc-solve/old-dumps/DUMPS-*/*
}

tot2()
{
    set -x
    perl ../scripts/gen-obf-mod-1.pl > t.sh
    FCS_PGO_THEME="--read-from-file 4,$(pwd)/t.sh" sudo /home/shlomif/bin/sudo_bench_fcs
    disp
    set +x
}

tot()
{
    set -x
    perl ../scripts/cmd-line-compiler compile
    make
    y
    set +x
}

y()
{
    sudo /home/shlomif/bin/sudo_bench_fcs
    disp
}

unalias z zz

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

alias p='git push'
# delta states test
delta()
{
    (
        set -x
        set -e
        cb
        ../source/Tatzer -l n2t
        fmt
        pt
        cmake -DFCS_DISABLE_DEBONDT_DELTA_STATES=1 ../source/
        fmt
        pt
    )
}

# test site
ts()
{
    (
        cs
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
        "$c_src"/Tatzer ${args}
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
    ctags {$c_src,$pats}/*.[ch]
}

export FCS_PATH="$b" FCS_SRC_PATH="$c_src"
export HTML_VALID_VNU_JAR=~/Download/unpack/net/www/validator/build/dist/vnu.jar
export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/fc-solve-tidyall.d"
PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$PATH:$site/node_modules/.bin"
# Temporary measure because valgrind-3.7.0 on mageia v7 does not handle
# the new glibc well so we need to use the one from git master HEAD.
PATH="$HOME/apps/valgrind/bin:$PATH"

proj_name='fcs'

# Clean up the environment for the valgrind tests to succeed.
# Commented out because now it makes things worse in t/t/build-process.t
# file.
# unset WD BROWSER CANBERRA_DRIVER CMAKE_MODULE_PATH DESKTOP_SESSION EDITOR G_FILENAME_ENCODING G_SLICE HARNESS_SUMMARY_COL_FAIL HARNESS_SUMMARY_COL_SUC HGEDITOR H HOMEPAGE_SSH_PATH LADSPA_PATH LAN LANGUAGE LC_ADDRESS LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MESSAGES LC_MESSAGES LC_MESSAGES LC_NAME LC_NUMERIC LC_PAPER LC_SOURCES LC_TELEPHONE LC_TIME LESSCHARSET MAIL MANPATH MALLOC_PERTURB_ META_CLASS MGA_MENU_STYLE MYVIMRC NLSPATH NOPASTE_SERVICES PERL_AUTOINSTALL PERL_MM_USE_DEFAULT PILOTPORT PYTHONDONTWRITEBYTECODE PYTHONSTARTUP QT4DOCDIR QTDIR QTINC QTLIB QT_XFT SAL_USE_VCLPLUGIN SCREENDIR SVN_EDITOR SYSTEMD_PAGER VIM VIMRUNTIME WD XDG_CURRENT_DESKTOP XDG_MENU_PREFIX _LXSESSION_PID

# export LC_ALL=en_US.UTF-8
