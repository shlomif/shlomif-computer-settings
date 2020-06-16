load_common bundle/git
load_common partests
load_common chdirs

base="$HOME/Docs/programming/Vim/vim-begin"
repo="$base/git/vim-begin"
trunk="$repo"
src="$trunk/vim-begin/tt2-source"
this="$src"
latemp_trunk="$src"
remote_repo="$(_shlomif_github "vim-begin")"

load_common latemp
pristine_copy=~/Backup/Arcs/sites--vim-begin-post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/sites--vim-begin-post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/sites--vim-begin-post-dest/this-incs-reduced
_post_dest="dest"
load_common latemp_diff

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$src=$src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (cd "$src" && make upload)
}

__add_to_path

proj_name='vim-begin'
