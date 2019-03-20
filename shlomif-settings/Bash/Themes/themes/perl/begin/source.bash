load_common bundle/git
load_common chdirs
load_common partests
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
export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/perl-begin-tidyall.d"
export VNU_CACHE="$HOME/Backup/Arcs/perl-begin-vnu-cache.json"

__add_to_path
proj_name='perl-begin'
