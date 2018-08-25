load_common bundle/inc1
load_common github
load_common chdirs
load_common ctags_all_langs

base="$HOME/Download/unpack/multimedia/vlc"
trunk="$base/vlc-git"
module="$trunk"
this="$module"

git_remote_shlomif="$(_shlomif_github "vlc")"
git_remote_upstream='git://git.videolan.org/vlc.git'

cd "$this"

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
        cd "$trunk" && ./bootstrap && . ~/conf/build/vlc-3.0-opt.sh && make -j4 install
    )
}

proj_name='vlc'
