load_common meta_inc1
load_common git

base="$HOME/progs/perl/cpan/App/Catable"
git_base="$base"
trunk="$base/catable"
module="$trunk/App-Catable"
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

proj_name='catable'
cd "$this"
