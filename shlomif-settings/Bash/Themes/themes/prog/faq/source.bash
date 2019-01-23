load_common bundle/git

remote_repo="$(_shlomif_github "Freenode-programming-channel-FAQ")"

base="$HOME/Docs/programming/irc/freenode-##programming/faq"
git_base="$base"
trunk="$base/FreenodesprogrammingWiki"
repo="$trunk"
src="$trunk"
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
        cd "$trunk" && \
        make
    )
}

t()
{
    (
        cd "$src" && sh test.sh
    )
}

e()
{
    cd "$src" && gvim -o FAQ.mdwn
}

proj_name='ProgFAQ'
