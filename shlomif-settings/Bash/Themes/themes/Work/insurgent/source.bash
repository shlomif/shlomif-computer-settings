load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/Work/insurgent"
git_base="$base/git"
git_dir="$git_base/www.insurgentsoftware.com"
auth="$git_dir"
this="$auth"
proj_name="Insurgent"

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
        "\$auth=$auth" \
        "\$git_dir=$git_dir" \
        "\$base=$base" \
        "~=$HOME"
}

t()
{
    (cd "$auth" && make runtest)
}

# Short for push.
Pu()
{
    (cd "$auth" && git push origin master)
}

pull()
{
    (cd "$auth" && git pull)
}

st()
{
    (cd "$auth" && git st)
}

myfiles="user-auth.pl t/login.t"

e()
{
    (cd "$auth" && gvim -o $myfiles)
}

serve()
{
    (cd "$auth" && ./user-auth.pl "daemon")
}

add()
{
    (cd "$auth" && git add $myfiles \
        public/*.css InsurgentSoftware/UserAuth/*.pm \
        InsurgentSoftware/UserAuth/*/*.pm
    )
}
