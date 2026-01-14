load_common mymake

this="$HOME/Download/unpack/graphics/Gimp/gimp-cvs"
# trunk="$this/gimp"
trunk="$this/impress-bug-fixing/gimp"
gimpressionist="$trunk/plug-ins/gimpressionist"
patches_dir="$this/patches"
current_patch_base="gimpressionist-filename-duality"
__UPLOAD_PATCHES_PATH="${HOMEPAGE_SSH_PATH}/gimp/gimpressionist/"

cat_patch()
{
    (cd $this ;
    bash gen-gimpressionist-fn-on-duality-patch.sh
    )
}

gimp()
{
    cmd="/usr/local/apps/gimp-1.3.x/bin/gimp-2.1"
    local flag="$1"
    if test "${flag}" = "-debug"
    then
        shift
        cmd="GIMP_PLUGIN_DEBUG=gimpressionist,run: $cmd"
    fi
    cmd="$cmd ~/Docs/Images/katie-holmes.jpg"
    eval "$cmd"
}

cd "$this"
