load_common mymake
load_common completion
load_common prompt
# load_common gen_patch

repos="https://svn.berlios.de/svnroot/repos/web-cpan/Test-Count/"
repos_trunk="${repos}trunk/"

base="$HOME/progs/perl/cpan/Test/Count"
trunk="$base/trunk"
modules_dir="$trunk/modules"
test_count="$modules_dir/Test-Count"
this="$test_count"
__perl_version="5.8.8"
build_scripts_dir="$trunk/build/test-and-install-all-modules"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${build_scripts_dir}/Modules.mak"

PATH="$inst_modules_dir/bin/:$PATH"
# export PERL5LIB="$inst_modules_dir/lib/perl5/site_perl/$__perl_version/:$inst_modules_dir/lib/perl5/$__perl_version"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

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

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd $this

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
    target="$1"
    shift
    make_params=""
    if [ "$target" == "runtest" ] ; then
        make_params="$make_params TEST_TARGET=runtest"
    fi
    (
        make -f "$modules_makefile" all $make_params
    )
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

setup()
{
    mkdir -p "$base"
    cd "$base"
    svn co "$repos_trunk"
    cd "$this"
}

PS1="\\u:\$(prompt)\\$ "

