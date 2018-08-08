load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make

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

proj_name='vim-begin'
