load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make
load_common git
load_common pypy

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
        b="$trunk/b"
        mkdir -p "$b"
        cd "$b" && \
        cmake "$src" && \
        make && rm -fr "$b"
    )
}

t()
{
    (
        cd "$src" && sh test.sh
    )
}

proj_name='ProjEuler'
