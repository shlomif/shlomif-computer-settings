load_common mymake
load_common completion
load_common prompt
load_common git
load_common ctags_this
# load_common gen_patch

base="$HOME/progs/perl/cpan/XML/LibXML"
git_base="$base/git"
trunk="$git_base/perl-XML-LibXML"
this="$trunk"
remote_repo="$(_shlomif_github "perl-XML-LibXML")"


xslt_base="$HOME/progs/perl/cpan/XML/LibXSLT"
xslt_hg_base="$HOME/progs/perl/cpan/XML/LibXSLT/hg"
xslt_trunk="$HOME/progs/perl/cpan/XML/LibXSLT/hg/perl-xml-libxslt"

export RELEASE_TESTING=1 AUTHOR_TESTING=1

__dist_name()
{
    (__check_for_distro &&
        cat META.yml | grep "^name:" | sed 's/^name: *//'
    )
}

__version()
{
    (__check_for_distro &&
        cat META.yml | grep "^version:" | sed 's/^version: *//'
    )
}

__check_for_distro()
{
    if [ -e "META.yml" ] ; then
        return 0
    else
        echo "Not a distro dir" 1>&2
        return 1
    fi
}

__test_distribution()
{
    __check_for_distro &&
    (
        make disttest
        rm -fr "$(__dist_name)-$(__version)"
    )
}

cd "$this"

__install_to_temp()
{
    (
        make -f "$modules_makefile" "$(pwd)"
    )
}


#    (
#        if [ -e Makefile.PL ] ; then
#            perl Makefile.PL PREFIX="$inst_modules_dir"
#            make
#            make test
#            make install
#        elif [ -e Build.PL ] ; then
#            perl Build.PL
#            ./Build
#            ./Build test
#            ./Build install prefix="$inst_modules_dir"
#        else
#            echo "Unknown instamethod" 1>&2
#            exit 1
#        fi
#    )

__prepare_install_all_to_temp_makefile()
{
    (cd "$build_scripts_dir" && perl create-makefile.pl)
}

__install_all_to_temp()
{
    (
        make -f "$modules_makefile" all
    )
}

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
