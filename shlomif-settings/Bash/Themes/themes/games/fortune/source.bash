load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "fortune-mod")"
base="$HOME/progs/C/fortune-mod"
git_base="$base/git"
trunk="$git_base/fortune-mod"
this="$trunk"
# this="$dd_branch"

export LIBAVL2_SOURCE_DIR="$HOME/Download/unpack/prog/c/avl-2.0.3/"
export FCS_USE_TEST_RUN=1
export FCS_PGO_THEME="-l obf" FCS_TEST_CLANG_FORMAT=1

# This causes problems with the threaded solver.
unset MALLOC_CHECK_

cd $this

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
        local cmd='ruby ../scripts/find-ids.rb *.[ch] */*.[ch] patsolve-shlomif/patsolve/*.[ch] > ids.txt'
        echo "$cmd"
        eval "$cmd"
    )
}

t()
{
    (
        export HARNESS_BREAK=1
        cd "$t_fcs/B" && \
            make -j4 && \
            perl "$c_src"/run-tests.pl
        n --msg "Freecell Solver Test Finished"
    )
}

# parallel-tests
pt()
{
    ( unset FCS_USE_TEST_RUN; t; )
}

make()
{
    if [ "$*" = "pgo" ]; then
        `which make` VERBOSE=1 "$@"
    else
        `which make` "$@"
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
    make -f "$t_fcs"/scripts/Makefile.gnu SRC_DIR="$c_src" -j4 "$@"
}

# Short for make
M()
{
    _Makefile_gnu__make clean
    _Makefile_gnu__make all
}

c()
{
    cd "$c"
}

cb()
{
    cd "$b"
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
        cd "$t_fcs/B" && \
            make -j4 && \
            perl "$c_src"/run-tests.pl --glob='{clang-format,perltidy,style-trailing-space}*.t'
    )
}

bpat()
{
    (
    mkdir -p "$pats_b"
    pb
    cmake "$pats" && make -j4 && make check && rm -fr "$pats_b" && rm -f "$pats/cmake"/*.cmake
    )
}

bp()
{
    bpat
}

ti1()
{
    perl "$c_src"/scripts/time-fcs.pl DUMPS-*/*
}

ti()
{
     ti1 | tac | cat -n | perl -lapE 's/:/\t/g; ' | less
}

proj_name='fcs'

# Clean up the environment for the valgrind tests to succeed.
# Commented out because now it makes things worse in t/t/build-process.t
# file.
# unset WD BROWSER CANBERRA_DRIVER CMAKE_MODULE_PATH DESKTOP_SESSION EDITOR G_FILENAME_ENCODING G_SLICE HARNESS_SUMMARY_COL_FAIL HARNESS_SUMMARY_COL_SUC HGEDITOR H HOMEPAGE_SSH_PATH LADSPA_PATH LAN LANGUAGE LC_ADDRESS LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MESSAGES LC_MESSAGES LC_MESSAGES LC_NAME LC_NUMERIC LC_PAPER LC_SOURCES LC_TELEPHONE LC_TIME LESSCHARSET MAIL MANPATH MALLOC_PERTURB_ META_CLASS MGA_MENU_STYLE MYVIMRC NLSPATH NOPASTE_SERVICES PERL_AUTOINSTALL PERL_MM_USE_DEFAULT PILOTPORT PYTHONDONTWRITEBYTECODE PYTHONSTARTUP QT4DOCDIR QTDIR QTINC QTLIB QT_XFT SAL_USE_VCLPLUGIN SCREENDIR SVN_EDITOR SYSTEMD_PAGER VIM VIMRUNTIME WD XDG_CURRENT_DESKTOP XDG_MENU_PREFIX _LXSESSION_PID

# export LC_ALL=en_US.UTF-8
