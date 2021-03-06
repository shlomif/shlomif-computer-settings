load_common mymake
load_common gen_patch

this="$HOME/Download/unpack/graphics/Gimp/gimp-cvs"
# trunk="$this/gimp"
trunk="$this/impress-revamp/gimp"
gimpressionist="$trunk/plug-ins/gimpressionist"
patches_dir="$this/patches"
current_patch_base="gimpressionist-revamp"
__UPLOAD_PATCHES_PATH="${HOMEPAGE_SSH_PATH}/gimp/gimpressionist/"

cat_patch()
{
    (cd $this ;
    # bash gen-gimpressionist-fu-patch.sh
    bash gen-gimpressionist-revamp-patch.sh
    )
}

gimp()
{
    cmd="/usr/local/apps/gimp-1.3.x/bin/gimp-2.1"
    if test "$1" = "-debug" ; then
        shift
        cmd="GIMP_PLUGIN_DEBUG=gimpressionist,run: $cmd"
    fi
    cmd="$cmd ~/Docs/Images/katie-holmes.jpg"
    eval "$cmd"
}

cd "$this"
