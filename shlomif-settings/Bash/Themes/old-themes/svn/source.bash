load_common mymake

this="/home/shlomi/progs/svn/SVN-From-Repos/vanilla/trunk"
tests_dir="$this/subversion/tests/clients/cmdline/"
test_file="$tests_dir/past_loc_tests.py"
patches_dir="/home/shlomi/progs/svn/SVN-From-Repos/patches"

Edit_tests()
{
    gvim "$test_file"
}

Edit_fs()
{
    gvim "$this/subversion/libsvn_fs/tree.c"
}

current_patch_base="peg-revision-tng"

cat_patch()
{
    (cd $this ; svn diff)
}

__get_latest_log_rev()
{
    __get_latest_current_patch "log.txt"
}

edit_log()
{
    (cd $this ;
        latest_log=$(__get_latest_log_rev) ;
        latest_patch=$(__get_latest_patch_rev) ;
        latest_patch_corresponding_log="$patches_dir/${current_patch_base}"-rev"$latest_patch".log.txt
        if test "$latest_log" -ne "$latest_patch" ; then
            cp "$patches_dir/${current_patch_base}"-rev"$latest_log".log.txt \
               "$latest_patch_corresponding_log";
        fi
        gvim "$latest_patch_corresponding_log";
    )
}

Run_svnserve()
{
    (cd $this;
    subversion/svnserve/svnserve -d -r `pwd`/subversion/tests/clients/cmdline
    )
}

Install_perl()
{
    (cd $this ;
    make swig-pl-lib ;
    (cd subversion/bindings/swig/perl/native &&
    (
    env APR_CONFIG=/usr/local/apps/apache2/bin/apr-config perl Makefile.PL ;
    make all test ;
    )
    )
    cmd="make install-swig-pl-lib"
    echo $cmd ;
    eval "$cmd" ;
    (
    cd subversion/bindings/swig/perl/native &&
    (
    cmd="su -c \"make install\""
    echo $cmd ;
    eval "$cmd" ;
    )
    )
    )
}
cd $this
