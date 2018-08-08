load_common mymake
load_common perl_dzil
load_common completion

base="$HOME/progs/perl/cpan/XML/RSS"
svk="$base/svk/local-trunk"
svn="$base/from-perl.org/trunk"
ask="$svn"
this="$svn"

cd "$this"

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
