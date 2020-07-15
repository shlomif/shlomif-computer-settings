load_common bundle/git

git_base="$HOME/Download/unpack/perl/web-sites-perl.org.il"
base="$git_base/perl.org.il"
trunk="$base"
site="$base/site"
bin="$site/new_site_bin"
sources="$site/new_site_sources"
remote_repo="$(_shlomif_github "perl.org.il")"

this="$sources"

prompt()
{
    __prompt_cmd \
        "\$site=$site" \
        "\$base=$base" \
        "~=$HOME"
}

gen_site()
{
    (cd "$bin" && mkdir -p dest && perl update_site.pl --outdir `pwd`/dest)
}

alias t='gen_site'

proj_name='perl-il-site'

cd "$this"
