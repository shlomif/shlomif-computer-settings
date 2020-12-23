proj_name='perl-begin'
load_common bundle/git
load_common chdirs
load_common partests

base="$HOME/Docs/programming/Perl/web-sites/perl-begin"
trunk="$base/trunk"
this="$trunk"
remote_repo="$(_shlomif_github "perl-begin")"

load_common latemp

pristine_copy=~/Backup/Arcs/sites--perl-begin-post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/sites--perl-begin-post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/sites--perl-begin-post-dest/this-incs-reduced
_post_dest="dest"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (cd "$trunk" && gmake -j4 upload upload_home_remote)
}
__add_to_path

out_of_tree_build()
{
    (
        set -e -x
        export MAKEFLAGS='-r'
        cd "$trunk"
        git clean -dfqx
        oot_build="$trunk/../b"
        rm -fr "$oot_build"
        mkdir -p "$oot_build"
        cd "$oot_build"
        perl ../trunk/gen-helpers
        gmake bulk-make-dirs
        gmake -j4 fastrender
        gmake -j4 test
    )
}

o()
{
    out_of_tree_build "$@"
}
