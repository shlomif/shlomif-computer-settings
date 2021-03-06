load_common bundle/git
load_common ctags_this

base="$HOME/progs/perl/cpan/HTML"
trunk="$base/HTML-T5"
module="$trunk"
this="$module"

github_base="html-tidy5"
git_remote_shlomif="$(_shlomif_github "$github_base")"
git_remote_petdance="git@github.com:petdance/$github_base.git"
git_remote_robrow="git@github.com:robrow/$github_base.git"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        git clone "$git_remote_shlomif" "$trunk"
        cd "$trunk"
        git remote add upstream "$git_remote_petdance"
        git remote add upstream2 "$git_remote_robrow"
    )
}

proj_name='HTML-T5'
cd $this
