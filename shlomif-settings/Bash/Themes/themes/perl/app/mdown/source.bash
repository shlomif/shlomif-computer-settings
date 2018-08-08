load_common mymake
load_common completion
load_common hg
load_common perl_dzil

# load_common gen_patch
base="$HOME/progs/perl/cpan/App/maniac-downloader"
trunk="$base"
app_dir="$trunk/App-ManiacDownloader"
this="$app_dir"

remote_repo="$(_shlomif_bitbucket "maniac-downloader")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$app_dir=$app_dir" \
        "\$trunk=$trunk" \
        "~=$HOME"
}

proj_name='App-ManDown'
