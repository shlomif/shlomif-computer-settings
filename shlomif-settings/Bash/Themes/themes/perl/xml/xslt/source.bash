load_common mymake
load_common completion
load_common prompt
load_common git
load_common funcs_for_perl_dists

xslt_base="$HOME/progs/perl/cpan/XML/LibXSLT"
xslt_git_base="$HOME/progs/perl/cpan/XML/LibXSLT/git"
xslt_trunk="$HOME/progs/perl/cpan/XML/LibXSLT/git/perl-xml-libxslt"

base="$xslt_base"
git_base="$xslt_git_base"
trunk="$xslt_trunk"
this="$trunk"

remote_repo="$(_shlomif_github "perl-XML-LibXSLT")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='XML-LibXSLT'

cd "$this"
