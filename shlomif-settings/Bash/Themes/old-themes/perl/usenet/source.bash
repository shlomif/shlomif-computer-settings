load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/www/NNTP-Iface"
trunk="$base/trunk"
modules_dir="$trunk/modules"
this="$modules_dir/CGI-Application-NetNewsIface"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${__themes_dir}/themes/$__theme/Modules.mak"

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
    ( cd "$modules_dir" && ctags -R )
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
    (
        perl ~/bin/gen-perl-modules-inst-makefile.pl \
            --prefix="$inst_modules_dir" \
            -o "$modules_makefile" \
            --dir="$modules_dir/CGI-Application-NetNewsIface" \
    )
}

__install_all_to_temp()
{
    (
        make -f "$modules_makefile" all
    )
}

prompt()
{
    __prompt_cmd "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "

