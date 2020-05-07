load_common bundle/dzil_git
load_common ctags_this

base="$HOME/progs/perl/cpan/XML/Grammar/Base"
git_base="$base"
trunk="$base/trunk"
grammar_base="$trunk/XML-GrammarBase"
this="$grammar_base"

remote_repo="$(_shlomif_github "perl-XML-GrammarBase")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='XML-GrammarBase'
