load_common mymake
load_common completion
load_common prompt
load_common git

# load_common gen_patch
base="$HOME/Download/unpack/perl/p6"
rb="$base/rakudobrew"

export PATH="${rb}/bin:$PATH"

trunk="$base/doc"
app_dir="$trunk"
this="$app_dir"

rw_repos_url="$($__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="Rx.pl")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Perl6'

