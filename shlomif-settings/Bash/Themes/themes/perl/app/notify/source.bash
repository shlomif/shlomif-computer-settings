load_common mymake
load_common completion
load_common hg

# load_common gen_patch
base="$HOME/progs/perl/cpan/App/Notifier"
trunk="$base/App-Notifier"
this="$trunk"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="app-notifier")"

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
        "~=$HOME"
}

proj_name='Notifier'

