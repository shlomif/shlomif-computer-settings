load_common bundle/dzil_git

base="$HOME/progs/perl/cpan/XML/SemanticDiff"
git_base="$base"
trunk="$base/trunk"
module="$trunk/perl/modules/XML-SemanticDiff"
this="$module"

remote_repo="$(_shlomif_github "perl-XML-SemanticDiff")"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='XML-SemanticDiff'

cd "$this"
