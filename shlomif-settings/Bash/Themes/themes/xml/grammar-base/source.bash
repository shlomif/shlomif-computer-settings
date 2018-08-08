load_common mymake
load_common completion
load_common prompt
load_common git
load_common perl_dzil

base="$HOME/progs/perl/cpan/XML/Grammar/Base"
git_base="$base"
trunk="$base/trunk"
grammar_base="$trunk/XML-GrammarBase"
this="$grammar_base"

remote_repo="$(_shlomif_github "perl-XML-GrammarBase")"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='XML-GrammarBase'
