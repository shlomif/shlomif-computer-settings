PS1="\u@\\h:\\w\$ "
# This is so the Gtk+ 2.x Theme will be the same in KDE as it is in
# GNOME.
unset GTK2_RC_FILES PROMPT_COMMAND
# Homepage uploading logic
. "$HOME/conf/trunk/shlomif-settings/Bash/defs/homepage.bash"
_reread_aliases()
{
    . ~/conf/trunk/shlomif-settings/bash-aliases/user_aliases.bash
}
_reread_aliases
. "$HOME/conf/trunk/shlomif-settings/Bash/defs/common.bash"
# http://modernperlbooks.com/mt/2012/01/speed-up-perlbrew-with-test-parallelism.html
export BITBUCKET_USERS=',shlomif,' GITHUB_USERS=',shlomif,thewml,' TEST_JOBS=4 PERLBREW_ROOT="$HOME/apps/perl/brew"
# . "${PERLBREW_ROOT}/etc/bashrc"
alias ls='ls --color=auto -N'
if test "`uname`" = "Linux"
then
    export XDG_RUNTIME_DIR="/run/user/$UID"
fi
if test -z "$QT_QPA_PLATFORMTHEME"
then
    # export QT_QPA_PLATFORMTHEME="qt5ct"
fi
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/apps/to-del-ncurses/lib"
PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$HOME/.perl6/bin:$PATH"
alias p='git push'
alias pu='git pushu'
if ! which latemp-config > /dev/null 2>&1
then
    export PATH="$HOME/apps/latemp/bin:$PATH"
fi
if ! git info > /dev/null 2>&1
then
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi
