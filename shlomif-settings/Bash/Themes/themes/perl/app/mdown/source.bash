load_common mymake
load_common completion
load_common git
load_common perl_dzil

base="$HOME/progs/perl/cpan/App/maniac-downloader"
git_base="$base"
trunk="$git_base/git"
app_dir="$trunk/App-ManiacDownloader"
this="$app_dir"

remote_repo="$(_shlomif_github "maniac-downloader")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$app_dir=$app_dir" \
        "\$trunk=$trunk" \
        "~=$HOME"
}

proj_name='App-ManDown'
