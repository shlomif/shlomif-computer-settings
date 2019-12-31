load_common bundle/git
load_common chdirs
load_common partests
load_common mymake

remote_repo="$(_shlomif_github "better-scm")"
base="$HOME/Docs/programming/SCM/better-scm/site"
git_base="$base"
trunk="$base/trunk"
comparison="$trunk/src/comparison"

load_common latemp

cd "$trunk"

m()
{
    gmake "$@"
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

pristine_copy=~/Backup/Arcs/better-scm-post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/better-scm-post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/better-scm-post-dest/this-incs-reduced
_post_dest="dest"

export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/better-scm-tidyall.d"
__add_to_path
proj_name='better-scm'
