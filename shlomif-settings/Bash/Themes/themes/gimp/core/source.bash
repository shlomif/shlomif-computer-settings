load_common mymake
load_common gen_patch

base="$HOME/Download/unpack/graphics/Gimp"
svn="$base/from-svn"
trunk="$svn/trunk"
this="$trunk"

export PKG_CONFIG_PATH="$HOME/apps/graphics/gegl/lib/pkgconfig:$HOME/apps/graphics/babl/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$HOME/apps/graphics/gegl/lib:$HOME/apps/graphics/babl/lib:$LD_LIBRARY_PATH"

__Vipe_upload_patch()
{
    local last_rev
    last_rev="$(__get_latest_patch_rev)" ;
    rsync --rsh=ssh -v --progress "$(__get_patch_path $last_rev)" "shlomif@vipe:public_html/gimp/gimpressionist/"
}

cd $this

