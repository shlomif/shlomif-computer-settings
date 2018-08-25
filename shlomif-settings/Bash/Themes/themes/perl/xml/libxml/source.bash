load_common bundle/inc1
load_common git
load_common ctags_this
load_common funcs_for_perl_dists

base="$HOME/progs/perl/cpan/XML/LibXML"
git_base="$base/git"
trunk="$git_base/perl-XML-LibXML"
this="$trunk"
remote_repo="$(_shlomif_github "perl-XML-LibXML")"


xslt_base="$HOME/progs/perl/cpan/XML/LibXSLT"
xslt_git_base="$HOME/progs/perl/cpan/XML/LibXSLT/git"
xslt_trunk="$HOME/progs/perl/cpan/XML/LibXSLT/git/perl-xml-libxslt"

export RELEASE_TESTING=1 AUTHOR_TESTING=1

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "\$xslt_trunk=$xslt_trunk" \
        "\$xslt_base=$xslt_base" \
        "~=$HOME"
}

proj_name='XML-LibXML'

# Short for convert for the Test.pm-to-Test-More conversion
conv()
{
    local fn="$1"
    ( perl "$trunk"/scripts/Test.pm-to-Test-More.pl --inplace "$fn" )
}

cd "$this"
