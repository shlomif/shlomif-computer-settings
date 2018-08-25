load_common prompt

an()
{
    export ANALYZE_DU_INPUT_FN=$HOME/Backup/rsync.net/unpack/home/shlomif/du.txt
    analyze-du "$@"
}

a="$HOME/Backup/rsync.net"
b="$HOME/Backup/rsync.net/unpack/home/shlomif"

regen()
{
    (
        cd ~/conf/trunk/shlomif-settings/backup-system/make-based/ && \
        make -f backup.mak rsync_net_home_dir
    )
    cd ~/Backup/rsync.net/ && bash UNPACK-me.bash
}

cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

unalias a
a()
{
    cd "$a"
}

b()
{
    cd "$b"
}

d()
{
    cd "$b"
    du -ah . | sort -h
}

proj_name='backup'
