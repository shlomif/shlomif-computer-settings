load_common mymake
load_common gen_patch

this="/home/shlomi/Download/unpack/graphics/Gimp/gimp-cvs"
# trunk="$this/gimp"
trunk="/home/shlomi/Download/unpack/graphics/Gimp/plug-ins/gimp-ace/2.2-port/trunk/0.6.3-starting-plug-in/src"
gimpressionist="$trunk/plug-ins/gimpressionist"
patches_dir="$this/patches"
__patches_scripts_dir="$this/scripts/gen-patch"
current_patch_base="gimpressionist-identifier-revamp"
__UPLOAD_PATCHES_PATH="${HOMEPAGE_SSH_PATH}/gimp/gimpressionist/"
vanilla="$this/write-access/vanilla/gimp"

export CVSROOT=":ext:shlomif@cvs.gnome.org:/cvs/gnome"
export CVS_RSH="ssh"

cat_patch()
{
    (cd $this ;
    bash ${__patches_scripts_dir}/gen-gimpress-work-patch.sh
    )
}

gimp()
{
    local cmd
    cmd="/usr/local/apps/gimp-1.3.x/bin/gimp-2.3"
    flag="$1"
    if test "${flag}" = "-debug"
    then
        shift
        cmd="GIMP_PLUGIN_DEBUG=gimp-ace,run: $cmd"
    elif test "${flag}" = "-valgrind"
    then
        shift
        cmd="GIMP_PLUGIN_DEBUG_WRAP=gimp-ace,run GIMP_PLUGIN_DEBUG_WRAPPER=\"valgrind --tool=memcheck --leak-check=yes --show-reachable=yes\" $cmd"
    fi
    cmd="$cmd ~/Docs/Images/katie-holmes.jpg"
    eval "$cmd"
}

__Vipe_upload_patch()
{
    local last_rev
    last_rev="$(__get_latest_patch_rev)" ;
    rsync --rsh=ssh -v --progress "$(__get_patch_path $last_rev)" "shlomif@vipe:public_html/gimp/gimpressionist/"
}

cd "$this"
