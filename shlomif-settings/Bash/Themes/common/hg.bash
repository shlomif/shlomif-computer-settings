setup()
{
    (
        mkdir -p "$hg_base"
        cd "$hg_base"
        hg clone "$remote_repo" "$trunk"
    )
    cd $this
}
