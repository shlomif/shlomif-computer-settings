cpan_bn="App-gimpgitbuild"
proj_name="$cpan_bn"
load_common bundle/dzil_git

export AUTHOR_TESTING=1

base="$HOME/progs/perl/cpan/App"
trunk="$base/$cpan_bn"
this="$trunk/$cpan_bn"

remote_repo="$(_shlomif_github "$cpan_bn")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$this=$this" \
        "\$trunk=$trunk" \
        "~=$HOME"
}

