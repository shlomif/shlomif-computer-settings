load_common mymake
load_common completion
load_common prompt
load_common git

base="$HOME/progs/perl/cpan/Rx.pl"
trunk="$base/Rx.pl"
app_dir="$trunk"
this="$app_dir"

rw_repos_url="$(_shlomif_github "Rx.pl")"

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
