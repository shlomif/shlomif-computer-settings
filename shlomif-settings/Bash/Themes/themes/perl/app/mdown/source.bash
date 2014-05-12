load_common mymake
load_common completion
load_common prompt
load_common hg

# load_common gen_patch
base="$HOME/progs/perl/cpan/App/maniac-downloader"
trunk="$base"
app_dir="$trunk/App-ManiacDownloader"
this="$app_dir"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="maniac-downloader")"

cd "$this"

_dzil_inst()
{
    (
        cd "$this" && \
            dzil test --release && \
            dzil install --install-command='bash ~/conf/build/perl/install-to-apps-perl-modules.sh'
    )
}

prompt()
{
    __prompt_cmd \
        "\$app_dir=$app_dir" \
        "\$trunk=$trunk" \
        "~=$HOME"
}

PS1="\\u[App-ManDown@\$(__hg_prompt_branch)]:\$(prompt)\\$ "

