load_common meta_inc1
load_common hg

base="$HOME/progs/perl/www/Web-Cpan-Site/"
hg_base="$base"
trunk="$base/trunk"
site="$trunk/wml"

remote_repo="$(_shlomif_bitbucket "web-cpan-site")"

this="$site"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

cd "$this"
