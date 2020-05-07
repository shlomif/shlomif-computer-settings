load_common bundle/inc1
load_common git

base="$HOME/progs/perl/www/Web-Cpan-Site/"
git_base="$base"
trunk="$base/trunk"
site="$trunk/wml"

remote_repo="$(_shlomif_github "web-cpan-site")"

this="$site"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

cd "$this"
