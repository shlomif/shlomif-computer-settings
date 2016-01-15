alias rm='rm -i' mv='mv -i' cp='cp -i' ls=' ls --color=auto'
export SVN_EDITOR='gvim -f'
export HISTSIZE=25000 FREECELL_SOLVER_QUIET=1 \
    EDITOR=vim VISUAL=vim  PAGER="less -isrr" \
    GIT_EDITOR="$SVN_EDITOR" HGEDITOR="$SVN_EDITOR" \
    NOPASTE_SERVICES="Debian Gist PastebinCom Pastie" \
    HARNESS_SUMMARY_COLOR_FAIL="bold red" HARNESS_SUMMARY_COLOR_SUCCESS="bold blue" \
    HARNESS_PLUGINS="ColorSummary ColorFileVerdicts AlternateInterpreters BreakOnFailure" \
    HARNESS_ALT_INTRP_FILE="$HOME/conf/Test-Run/alternate-interpreters.yml" \
    HARNESS_OPTIONS=c PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps --alldeps" \
    CPAN2PKG_DONT_CPANP_X=1
unset LESSOPEN
umask 022
if test -e /etc/debian_version ; then
    export CPATH="$(perl -e 'print join(":", grep { ! $encountered{$_}++ } grep { length($_) > 0 } map { split /:/, $_ } $ENV{CPATH}, "$ENV{HOME}/apps/libtap/include");')"
    export CMAKE_PREFIX_PATH="$HOME/apps/libtap:$CMAKE_PREFIX_PATH"
fi
_Theme()
{
    Theme "$@"
}
__complete_with_themes "_Theme"
# This is for X-over-ssh apps to know how to set their fonts.
if test -z "$ORIGIN_HOSTNAME" ; then
    export ORIGIN_HOSTNAME="$HOSTNAME"
fi
# See http://bugs.mageia.org/show_bug.cgi?id=237
shopt -s direxpand
unalias d 2>/dev/null
d() { ls -A | xargs -d '\n' \du -s -- | sort -n ;}
