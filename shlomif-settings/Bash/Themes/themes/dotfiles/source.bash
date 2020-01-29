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

__regen_themes_list()
{
    ( cd "$trunk/shlomif-settings/Bash/Themes/" && bash gen_list.sh )
}

t()
{
    __regen_themes_list
    ( cd "$trunk" && prove shlomif-settings/tests/*.t )
}

-r()
{
    __regen_themes_list "$@"
}

cd "$this"
proj_name='dotfiles'
