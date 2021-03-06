load_common bundle/git
load_common chdirs

base=~/progs/JS/web-developer-tools
trunk="$base/open-web-developer-tools"
this="$trunk/open-web-dev-tools"
remote_repo="$(_shlomif_github "open-web-developer-tools")"

PATH="$PATH:$this/node_modules/.bin"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (cd "$this" && make -j4 upload)
}

t()
{
    (cd "$this" && make -j4 test)
}

proj_name='web-dev-tools'
