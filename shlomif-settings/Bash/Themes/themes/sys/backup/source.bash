load_common prompt

an()
{
    export ANALYZE_DU_INPUT_FN=$HOME/Backup/rsync.net/unpack/home/shlomif/du.txt
    analyze-du "$@"
}

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

proj_name='backup'

