load_common bundle/git
load_common chdirs
load_common latemp

base="$HOME/Docs/programming/Perl/web-sites/perl-begin"
trunk="$base/trunk"
this="$trunk"
remote_repo="$(_shlomif_github "perl-begin")"

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
    (cd "$trunk" && gmake -j4 upload upload_hexten upload_home_remote)
}

__add_to_path
proj_name='perl-begin'
