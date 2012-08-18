_reread_aliases()
{
    if ! test -f ~/.common_aliases.bash ; then
        cp -f ~/conf/trunk/shlomif-settings/bash-aliases/common_aliases.bash ~/.common_aliases.bash
    fi
    source ~/conf/trunk/shlomif-settings/bash-aliases/user_aliases.bash
}
_reread_aliases
