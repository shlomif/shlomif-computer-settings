alias rm='rm -i' mv='mv -i' cp='cp -i' ls=' ls --color=auto'
export SVN_EDITOR='gvim -f'
    # HARNESS_SUMMARY_COLOR_SUCCESS="bold blue" \
export HISTSIZE=200000 FREECELL_SOLVER_QUIET=1 \
    EDITOR=nvim VISUAL=nvim  PAGER="less -isrr" \
    BZR_EDITOR="$SVN_EDITOR" GIT_EDITOR="$SVN_EDITOR" HGEDITOR="$SVN_EDITOR" \
    NOPASTE_SERVICES="Debian Gist PastebinCom Pastie" \
    HARNESS_SUMMARY_COLOR_SUCCESS="bold green" \
    HARNESS_SUMMARY_COLOR_FAIL="bold red" \
    HARNESS_PLUGINS="ColorSummary ColorFileVerdicts AlternateInterpreters BreakOnFailure" \
    HARNESS_ALT_INTRP_FILE="$HOME/conf/trunk/shlomif-settings/perl/Test-Run/alternate-interpreters.yml" \
    HARNESS_OPTIONS=c PERL_MM_USE_DEFAULT=1 CPAN2PKG_DONT_CPANP_X=1

# PERL_AUTOINSTALL="--skipdeps --alldeps"

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
__complete_with_themes '_Theme'
-t()
{
    Theme "$@"
}
__complete_with_themes '-t'
# This is for X-over-ssh apps to know how to set their fonts.
if test -z "$ORIGIN_HOSTNAME" ; then
    export ORIGIN_HOSTNAME="$HOSTNAME"
fi
# See http://bugs.mageia.org/show_bug.cgi?id=237
if test -n "$BASH_VERSION"
then
    shopt -s direxpand
fi
unalias d 2>/dev/null
d() { ls -A | xargs -d '\n' \du -s -- | sort -n ;}
# See https://unix.stackexchange.com/questions/10525
which()
{
    /usr/bin/which "$@"
}
