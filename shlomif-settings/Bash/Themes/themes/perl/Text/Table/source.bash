load_common bundle/dzil_git

cpan_base="$HOME/progs/perl/cpan"
base="$cpan_base/Text/Table"
git_base="$base"
trunk="$base/git"
module="$trunk/Text-Table"
this="$module"
remote_repo="$(_shlomif_github "Text-Table")"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Text-Table'
cd $this
