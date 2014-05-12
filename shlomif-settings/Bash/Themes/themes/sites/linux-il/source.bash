load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make

base="$HOME/Docs/IGLU/linux.org.il/linux.org.il-new-site"
repo="$base"
trunk="$repo"
src="$trunk/www.linux.org.il-new-site/template-toolkit"
this="$src"

cd $this


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

proj_name='www.linux.org.il'

