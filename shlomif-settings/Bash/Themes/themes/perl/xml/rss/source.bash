load_common mymake
load_common completion
# load_common gen_patch

base="$HOME/progs/perl/cpan/XML/RSS"
svk="$base/svk/local-trunk"
svn="$base/from-perl.org/trunk"
ask="$svn"
patches_dir="$base/patches"
this="$svn"

cd "$this"

diff_remote_to_local()
{
    svk diff //mirror/XML-RSS/trunk //local/XML-RSS/local-trunk
}

__test_coverage()
{
    (
        cd "$this"
        rm -fr cover_db.old
        mv cover_db cover_db.old
        cover -delete
        HARNESS_PERL_SWITCHES="-MDevel::Cover" make runtest
        cover
    )
}

__myctags()
{
    (
        cd "$this"
        ctags -f tags --recurse --totals \
            --exclude='**/blib/**' --exclude='**/t/lib/**' \
            --exclude='**/.svn/**' --exclude='*~' \
            --languages=Perl --langmap=Perl:+.t
    )
}
__update_main_file_test_coverage()
{
    (
        cd "$this"
        rm -fr cover_db.old
        cp -a cover_db cover_db.old
        HARNESS_PERL_SWITCHES="-MDevel::Cover" runprove --blib t/items-are-0.t
        cover
    )
}
