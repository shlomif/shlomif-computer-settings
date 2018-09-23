load_common bundle/git
load_common mymake

remote_repo="$(_shlomif_github "better-scm")"
base="$HOME/Docs/programming/SCM/better-scm/site"
git_base="$base"
trunk="$base/trunk"
comparison="$trunk/src/comparison"

cd "$trunk"

m()
{
    make "$@"
}

t()
{
    make test
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='better-scm'
