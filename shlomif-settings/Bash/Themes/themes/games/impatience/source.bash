load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/Games/Impatience"
trunk="$base/git"
this="$trunk"

rw_repos_url="git@github.com:shlomif/Games-Impatience.git"

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        git clone "$rw_repos_url" git
    )
}

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
    (
        make -f "$modules_makefile" all
    )
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u[impatience]:\$(prompt)\\$ "

