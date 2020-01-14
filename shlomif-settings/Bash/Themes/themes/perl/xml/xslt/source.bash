load_common bundle/git
load_common funcs_for_perl_dists

xslt_base="$HOME/progs/perl/cpan/XML/LibXSLT"
xslt_git_base="$HOME/progs/perl/cpan/XML/LibXSLT/git"
xslt_trunk="$HOME/progs/perl/cpan/XML/LibXSLT/git/perl-xml-libxslt"

base="$xslt_base"
git_base="$xslt_git_base"
trunk="$xslt_trunk"
this="$trunk"

export RELEASE_TESTING=1 AUTHOR_TESTING=1
export HARNESS_OPTIONS="j4:c" TEST_JOBS=4

remote_repo="$(_shlomif_github "perl-XML-LibXSLT")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='XML-LibXSLT'

t()
{
    perl Makefile.PL && make disttest
}
export XML_LIBXML_ENABLE_TIDYALL=1
cd "$this"
