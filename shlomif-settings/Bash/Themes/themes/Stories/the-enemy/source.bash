load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/Docs/Humour/The-Enemy"
hg_base="$base"
trunk="$base/hg"
repos="$trunk/The-Enemy"
this="$repos"
rw_repos_url="ssh://hg@bitbucket.org/shlomif/the-enemy"

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

PS1="\\u[The-Enemy]:\$(prompt)\\$ "

