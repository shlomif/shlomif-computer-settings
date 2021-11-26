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

    # if-body must not be empty in bash/etc.
    true
fi
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/apps/to-del-ncurses/lib"
PATH="$HOME/apps/golang/bin:$HOME/.local/bin:$HOME/.perl6/bin:$PATH"
alias p='git push'
alias pu='git pushu'
if ! which latemp-config > /dev/null 2>&1
then
    export PATH="$HOME/apps/latemp/bin:$PATH"
fi

enable_local_lib()
{
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
}

if ! git info > /dev/null 2>&1
then
    enable_local_lib
fi

_enable_git_info_prompt="1"

__git_info_prompt_command()
{
    if test -e ".git" && test "$_enable_git_info_prompt" = "1"
    then
        (
        enable_local_lib
        git info info
        )
    fi
}

# Protecting from reboots when doing reb[PgUp]
# for rebuild
reboot()
{
    if declare -f "rebuild" > /dev/null 2>&1
    then
        echo "You probably wanted 'rebuild'"
    else
        `which reboot` "$@"
    fi
}
# Avoid installing pip / pip3 / pip2 in a system path
# This makes installation buggier
for bn in "pip" "pip2" "pip3" "pip-2" "pip-3"
do
    exe_fn=~/.local/bin/"$bn"
    if test -e "$exe_fn"
    then
        echo "$exe_fn exists!" >> "$reminder_file"
    fi
done
