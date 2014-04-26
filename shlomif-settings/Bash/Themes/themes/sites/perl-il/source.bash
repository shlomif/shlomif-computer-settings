load_common completion
load_common prompt

base="$HOME/progs/perl/forums/Israel.PM/perl.org.il"
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
    (cd "$bin" && perl update_site.pl --outdir dest)
}

PS1="\\u[perl-il-site]:\$(prompt)\\$ "

cd $this

