load_common mymake
load_common completion
load_common prompt
load_common sys
# load_common gen_patch

base="$HOME/progs/perl/net/irc/bots/mozbot"
hg="$base/mozbot"
trunk="$hg"
cvs="$base/cvssrc/mozbot"

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
    (
        cd "$trunk" && \
        ctags -f tags --recurse --totals \
            --exclude='**/.hg/**' \
            --exclude='*~' \
            --languages=Perl --langmap=Perl:+.t
    )
}

cd $this

__install_to_temp()
{
    (
        make -f "$modules_makefile" "$(pwd)"
    )
}

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
        "\$hg=$hg" \
        "\$base=$base" \
        "~=$HOME"
}

check()
{
    (cd "$trunk" && perl -cT mozbot.pl)
}

run()
{
    (cd "$trunk" && perl -T mozbot.pl)
}

c()
{
    check "$@"
}

Pu()
{
    (
        cd "$trunk"
        _sys hg push 'ssh://hg@bitbucket.org/shlomif/mozbot-shlomif'
    )
}

proj_name='mozbot'

cd "$trunk"

