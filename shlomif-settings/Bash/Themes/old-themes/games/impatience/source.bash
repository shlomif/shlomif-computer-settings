load_common mymake
load_common completion
load_common prompt
load_common git

base="$HOME/progs/perl/cpan/Games/Impatience"
git_base="$git_base"
trunk="$base/git"
this="$trunk"

remote_repo="$(_shlomif_github "Games-Impatience")"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd $this

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='impatience'
