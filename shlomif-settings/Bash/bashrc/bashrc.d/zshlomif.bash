PS1="\u@telaviv1:\\w\$ "
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