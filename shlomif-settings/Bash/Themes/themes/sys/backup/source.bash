load_common prompt

an()
{
    export ANALYZE_DU_INPUT_FN=$HOME/Backup/rsync.net/unpack/home/shlomif/du.txt
    analyze-du "$@"
}

b="$HOME/Backup/rsync.net"
a="$HOME/Backup/rsync.net/unpack/home/shlomif"

regen()
{
    (
        cd ~/Docs/Svn/progs/backup/make-based
        make -f backup.mak rsync_net_home_dir
    )
    cd ~/Backup/rsync.net/ && . UNPACK-me.bash
}


cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

a()
{
    cd "$a"
}

b()
{
    cd "$b"
}

proj_name='backup'

