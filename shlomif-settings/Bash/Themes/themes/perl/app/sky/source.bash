load_common mymake
load_common completion
load_common prompt
load_common git

# load_common gen_patch
base="$HOME/progs/perl/cpan/App/Sky"
trunk="$base/git"
app_dir="$trunk/Sky-uploader/App-Sky"
this="$app_dir"

rw_repos_url="$(_shlomif_github "Sky-uploader")"

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
        "\$base=$base" \
        "~=$HOME"
}

proj_name='app-sky'

