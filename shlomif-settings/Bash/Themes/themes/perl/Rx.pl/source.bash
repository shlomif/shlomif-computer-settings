load_common mymake
load_common completion
load_common prompt
load_common git

# load_common gen_patch
base="$HOME/progs/perl/cpan/Rx.pl"
trunk="$base/Rx.pl"
app_dir="$trunk"
this="$app_dir"

rw_repos_url="$($__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="Rx.pl")"

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
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Rx.pl'

