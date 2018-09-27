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

rebuild()
{
    (
        set -x
        set -e
        cd "$trunk"
        time bin/rebuild
        n -m "rebuild"
    )
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

export PATH="$HOME/apps/latemp/bin:$HOME/apps/golang/bin:$HOME/.local/bin:$HOME/apps/test/wml/bin:$PATH"
export PATH="$HOME/apps/quadpres/bin:$HOME/Download/unpack/xml/ebookmaker:$trunk/node_modules/.bin:$PATH:/usr/sbin" QUAD_PRES_QUIET=1
dedup_pathvar PATH
dedup_pathvar PERL5LIB
dedup_pathvar PYTHONPATH
proj_name='better-scm'
