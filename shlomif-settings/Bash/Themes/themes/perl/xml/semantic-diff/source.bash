load_common mymake
load_common completion
load_common prompt
load_common git
load_common perl_dzil

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
