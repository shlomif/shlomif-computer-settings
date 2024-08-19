load_common du
load_common prompt

an()
{
    export ANALYZE_DU_INPUT_FN=$HOME/Backup/rsync.net/unpack$HOME/du.txt
    analyze-du "$@"
}

a="$HOME/Backup/rsync.net"
b="$HOME/Backup/rsync.net/unpack$HOME"

regen()
{
    (
        cd ~/conf/trunk/shlomif-settings/backup-system/make-based/ && \
        make -f backup.mak rsync_net_home_dir
    )
    cd ~/Backup/rsync.net/ && bash ~/conf/trunk/shlomif-settings/backup-system/make-based/UNPACK-backup-archive.bash
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
