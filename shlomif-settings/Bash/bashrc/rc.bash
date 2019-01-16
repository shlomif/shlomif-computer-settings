if [ -f /etc/bashrc ]
then
    . /etc/bashrc
fi
unalias which 2>/dev/null
. ~/conf/trunk/shlomif-settings/Bash/bashrc/common.bash
