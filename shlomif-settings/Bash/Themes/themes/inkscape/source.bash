load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make

. ~/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/Dev-Path-Configs-Source-Me.bash

ink="$HOME/Download/unpack/graphics/inkscape"
base="$ink"
# _base_trunk="$ink/inkscape"
_base_trunk="$ink/shlomif--trunk-refactoring"
trunk="$_base_trunk"
c_src="$_base_trunk"
this="$c_src"
# build="$base/B"
build="$base/B-refact"
b="$build"
c="$c_src"

setup()
{
    (
        mkdir -p "$base"
        cd "$_base"
        bzr checkout lp:inkscape
        cd "$trunk"
        git remote add github 'git@github.com:shlomif/fc-solve.git'
    )
    cd "$this"
}

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$build=$build" \
        "\$trunk=$trunk" \
        "\$ink=$ink" \
        "~=$HOME"
}

conf()
{
    (
        mkdir -p "$build"
        cd "$build"
        bash ~/conf/build/inkscape-cmake.sh
    )
}

b()
{
    (
        cd "$build" && \
            ninja -j4 \
            ; n --msg "Inkscape build finished"
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

f()
{
    (
        cd "$trunk"
        ruby /home/shlomif/progs/freecell/git/fc-solve/fc-solve/scripts/find-ids.rb $( ack --sort -f --cpp --cc ) > ids.txt
    )
}

alias g='gvim ids.txt +cbuf +cope +"sp scripts/ids-whitelist.txt" +"sp scripts/ids-whitelist.txt"'

proj_name='ink'

# Clean up the environment for the valgrind tests to succeed.
# Commented out because now it makes things worse in t/t/build-process.t
# file.
# unset WD BROWSER CANBERRA_DRIVER CMAKE_MODULE_PATH DESKTOP_SESSION EDITOR G_FILENAME_ENCODING G_SLICE HARNESS_SUMMARY_COL_FAIL HARNESS_SUMMARY_COL_SUC HGEDITOR H HOMEPAGE_SSH_PATH LADSPA_PATH LAN LANGUAGE LC_ADDRESS LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MESSAGES LC_MESSAGES LC_MESSAGES LC_NAME LC_NUMERIC LC_PAPER LC_SOURCES LC_TELEPHONE LC_TIME LESSCHARSET MAIL MANPATH MALLOC_PERTURB_ META_CLASS MGA_MENU_STYLE MYVIMRC NLSPATH NOPASTE_SERVICES PERL_AUTOINSTALL PERL_MM_USE_DEFAULT PILOTPORT PYTHONDONTWRITEBYTECODE PYTHONSTARTUP QT4DOCDIR QTDIR QTINC QTLIB QT_XFT SAL_USE_VCLPLUGIN SCREENDIR SVN_EDITOR SYSTEMD_PAGER VIM VIMRUNTIME WD XDG_CURRENT_DESKTOP XDG_MENU_PREFIX _LXSESSION_PID

# export LC_ALL=en_US.UTF-8
