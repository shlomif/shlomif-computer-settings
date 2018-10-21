load_common bundle/git
load_common partests
load_common chdirs
load_common latemp

base="$HOME/Docs/programming/Vim/vim-begin"
repo="$base/git/vim-begin"
trunk="$repo"
src="$trunk/vim-begin/tt2-source"
this="$src"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$src=$src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (cd "$src" && make upload)
}

__add_to_path

proj_name='vim-begin'
