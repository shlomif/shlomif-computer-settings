load_common bundle/git
load_common chdirs

base="$HOME/Download/unpack/graphics/gimp"
git_base="$base/git"
trunk="$git_base/gimp"
this="$trunk"
remote_repo='git://git.gnome.org/gimp'
proj_name="gimp"
c_src="$this"

export PKG_CONFIG_PATH="$HOME/apps/graphics/gegl/lib/pkgconfig:$HOME/apps/graphics/babl/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$HOME/apps/graphics/gegl/lib:$HOME/apps/graphics/babl/lib:$LD_LIBRARY_PATH"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$git_base=$git_base" \
        "\$base=$base" \
        "~=$HOME"
}

cd "$this"
