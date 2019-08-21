load_common bundle/inc1
load_common git

base="$HOME/Docs/Humour/The-Enemy"
git_base="$base"
trunk="$base/git"
repos="$trunk/the-enemy"
this="$repos"
remote_repo="$(_shlomif_github "the-enemy")"

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
