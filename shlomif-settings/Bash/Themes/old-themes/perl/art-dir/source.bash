load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/Art-Directory"
trunk="$base/hg"
module="$trunk/Web-Directory-for-Artwork"
this="$module"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

app_base="app_catable"
serve()
{
    (cd "$module" && perl "$@" script/${app_base}_server.pl --port=3001)
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}
proj_name='art-directory'
cd $this
