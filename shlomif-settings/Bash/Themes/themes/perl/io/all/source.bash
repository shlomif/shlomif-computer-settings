load_common bundle/git
load_common ctags_this

base="$HOME/progs/perl/cpan/IO/All"
trunk="$base/io-all-pm"
module="$trunk"
this="$module"

git_remote_shlomif="$(_shlomif_github "io-all-pm")"
git_remote_ingy='git@github.com:ingydotnet/io-all-pm.git'

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        git clone "$git_remote_shlomif"
        cd "$trunk"
        git remote add ingy "$git_remote_ingy"
    )
}

proj_name='IO-All'
cd $this
