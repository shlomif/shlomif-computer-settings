load_common mymake
load_common completion
load_common prompt
# load_common gen_patch
base="$HOME/progs/perl/cpan/CPANHQ/"
trunk="$base/cpanhq"
this="$trunk"

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

serve()
{
    (cd "$trunk" && perl "$@" script/cpanhq_server.pl)
}

minicpan_local_dir()
{
    perl -Mstrict -Mwarnings -le 'use CPAN::Mini; my %conf = CPAN::Mini->read_config(); print $conf{"local"}'
}

prompt()
{
    __prompt_cmd \
        "\$plugins=$plugins" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

run_indexing()
{
    (cd "$trunk" && perl tmp/index.pl "$(minicpan_local_dir)" )
}

# PS1="\\u:\$(prompt)\\$ "

