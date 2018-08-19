load_common meta_inc1
load_common hg

base="$HOME/Docs/Humour/The-Enemy"
hg_base="$base"
trunk="$base/hg"
repos="$trunk/The-Enemy"
this="$repos"
remote_repo="$(_shlomif_bitbucket "the-enemy")"

export THE_ENEMY_DEST="the-enemy-glareenxet"

cd $this

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "~=$HOME"
}

up()
{
    (
        cd "$trunk"
        make upload
        HOMEPAGE_SSH_PATH="${__HOMEPAGE_REMOTE_PATH}" make upload
    )
}

proj_name='The-Enemy'
