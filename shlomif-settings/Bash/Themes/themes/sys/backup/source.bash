load_common prompt

an()
{
    cat ~/Backup/rsync.net/unpack/home/shlomif/du.txt | ~/bin/analyse-du.pl "$@"
}

regen()
{
    (
        cd ~/Docs/Svn/progs/backup/make-based
        make -f backup.mak rsync_net_home_dir
    )
    ( cd ~/Backup/rsync.net/ && . UNPACK-me.bash )
}

cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

proj_name='backup'

