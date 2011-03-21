load_common mymake
load_common completion
load_common prompt

base="$HOME/Docs/Humour/The-Enemy"
repos="$base/hg/The-Enemy"
trunk="$repos"
this="$trunk"
rw_repos_url="ssh://hg@bitbucket.org/shlomif/the-enemy"

export THE_ENEMY_DEST="the-enemy-glareenxet"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        hg clone "$rw_repos_url" hg
    )
}

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

