load_common mymake
load_common completion
load_common prompt
load_common github

base="$HOME/Download/unpack/multimedia/vlc"
trunk="$base/vlc-git"
module="$trunk"
this="$module"

git_remote_shlomif="$(_shlomif_github "vlc")"
git_remote_upstream='git://git.videolan.org/vlc.git'

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd $this

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
        git clone "$git_remote_shlomif" "$trunk"
        cd "$trunk"
        git remote add upstream "$git_remote_upstream"
    )
}

mi()
{
    (
        cd "$trunk" && ./bootstrap && . ~/conf/build/vlc-3.0-opt.sh && make -j4 install
    )
}

proj_name='vlc'
