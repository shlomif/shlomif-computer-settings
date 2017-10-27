load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "project-euler")"

base="$HOME/progs/riddles/project-euler/"
git_base="$base"
trunk="$base/git"
repo="$trunk"
src="$trunk/project-euler"
this="$src"

s="$src"
c="$s"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$src=$src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

b()
{
    (
        cd "$trunk/b"
        make
    )
}

proj_name='ProjEuler'

