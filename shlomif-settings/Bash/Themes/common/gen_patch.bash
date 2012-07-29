#######################################################
# To use this file set the following global variables:
# * $patches_dir
# * $current_patch_base
# * $__UPLOAD_PATCHES_PATH
# * The function (or script) 'cat_patch' that generates an up to date
#   patch and writes it to stdout. (should work from every path)

__get_latest_patch_related_file_rev()
{
    local file_prefix
    file_prefix="$1"
    shift
    local file_ext
    file_ext="$1"
    shift
    (cd $patches_dir ; 
        ls "$file_prefix"*."$file_ext" | 
            sed 's/^'"$file_prefix"'-rev\([0-9]\+\).'"$file_ext"'/\1/' | 
            sort -n |
            tail -1
    )
}

__get_latest_current_patch()
{
    local file_ext
    file_ext="$1"
    shift
    __get_latest_patch_related_file_rev "$current_patch_base" "$file_ext"
}

__get_latest_patch_rev()
{
    __get_latest_current_patch "patch"
}

__get_patch_path()
{
    local rev
    rev="$1"
    shift
    echo "$patches_dir/${current_patch_base}"-rev"$rev".patch
}

save_patch()
{
    local last_rev last_path new_path new_rev
    last_rev="$(__get_latest_patch_rev)" ; 
    let new_rev=last_rev+1 ;
    last_path="$(__get_patch_path $last_rev)"
    new_path="$(__get_patch_path $new_rev)"
    cat_patch > "$new_path"
    if cmp -s "$new_path" "$last_path" ; then
        echo "Patch is the same as the last revision" 1>&2
        rm -f "$new_path"
    fi
}

upload_patch()
{
    local last_rev
    last_rev="$(__get_latest_patch_rev)" ;
    rsync --rsh=ssh -v --progress "$(__get_patch_path $last_rev)" "${__UPLOAD_PATCHES_PATH}"
}


