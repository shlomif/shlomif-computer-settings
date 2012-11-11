alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
export HISTSIZE=25000
alias ls='ls --color=auto'
export FREECELL_SOLVER_QUIET=1
export EDITOR=vim VISUAL=vim  PAGER="less -isrr" SVN_EDITOR="gvim -f"
export GIT_EDITOR="$SVN_EDITOR" HGEDITOR="$SVN_EDITOR"
umask 022
if test -e /etc/debian_version ; then
    export CPATH="$HOME/apps/libtap/include:$CPATH"
    export CMAKE_PREFIX_PATH="$HOME/apps/libtap:$CMAKE_PREFIX_PATH"
fi
mikmod()
{
    (
        LD_LIBRARY_PATH="$HOME/apps/multimedia/libmikmod/lib" \
            $HOME/apps/multimedia/mikmod/bin/mikmod -d 1 "$@"
    )
}

_mikmodify()
{
    export LD_LIBRARY_PATH="/home/shlomif/apps/multimedia/libmikmod/lib:$LD_LIBRARY_PATH"
    PATH="$HOME/apps/multimedia/mikmod/bin:$PATH"
}
export NOPASTE_SERVICES="Debian Gist Pastie PastebinCom"
# For TAP::Harness / Test::Harness.
export HARNESS_SUMMARY_COL_SUC="bold blue" HARNESS_SUMMARY_COL_FAIL="bold red"
unset LESSOPEN
# To fix the Thunar/Theme ambiguity.
_Theme()
{
    Theme "$@"
}
__complete_with_themes "_Theme"
export HARNESS_PLUGINS="ColorSummary ColorFileVerdicts AlternateInterpreters BreakOnFailure"
export HARNESS_ALT_INTRP_FILE="$HOME/conf/Test-Run/alternate-interpreters.yml"
# For the perl5 test suite (see t/harness)
export HARNESS_OPTIONS=c
export PERL_MM_USE_DEFAULT=1
export PERL_AUTOINSTALL="--skipdeps --alldeps"
# This is for X-over-ssh apps to know how to set their fonts.
if test -z "$ORIGIN_HOSTNAME" ; then
    export ORIGIN_HOSTNAME="$HOSTNAME"
fi

