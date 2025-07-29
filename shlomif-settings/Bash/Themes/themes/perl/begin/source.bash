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

PATH="${PATH}:${this}/bin/build-time-helpers"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

upload()
{
    (cd "$trunk" && gmake -j4 upload upload_home_remote)
}

up()
{
    upload
}

test_and_upload()
{
    (
    set -e -x
    rebuild
    upload
    )
}

-u()
{
    test_and_upload
}

__add_to_path

oot_build="$trunk/../b"

out_of_tree_build()
{
    (
        set -e -x
        export MAKEFLAGS='-r'
        cd "$trunk"
        git clean -dfqx
        bash bin/install-npm-deps.sh
        compass compile
        perl bin/my-cookiecutter.pl
        if test "$oot_build" != "$trunk"
        then
            rm -fr "$oot_build"
            mkdir -p "$oot_build"
        fi
        cd "$oot_build"
        perl "${trunk}/gen-helpers"
        gmake bulk-make-dirs
        gmake -j4 fastrender
        gmake -j4 test
    )
}

o()
{
    out_of_tree_build "$@"
}
