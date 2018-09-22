load_common bundle/git
load_common chdirs

conf="$HOME/conf"
trunk="$conf/trunk"
base="$trunk"
this="$base"

__edit()
{
    (cd "$this" &&
        gvim -p To_Do.txt Done.txt Projects.txt
    )
}

e()
{
    __edit
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

t()
{
    ( cd "$trunk" && prove shlomif-settings/tests/*.t )
}

cd "$this"
proj_name='dotfiles'
