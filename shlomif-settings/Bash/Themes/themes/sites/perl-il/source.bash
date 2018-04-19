load_common completion
load_common git
load_common prompt

base="$HOME/Download/unpack/perl/web-sites-perl.org.il/perl.org.il"
site="$base/site"
bin="$site/new_site_bin"
sources="$site/new_site_sources"

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

cd $this
