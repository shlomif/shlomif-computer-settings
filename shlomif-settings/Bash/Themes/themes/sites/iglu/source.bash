proj_name='iglu'
load_common bundle/git

git_base="$HOME/Docs/IGLU/iglu.org.il"
base="$git_base/iglu.org.il-site-sources"
repo="$base"
trunk="$repo"
src="$trunk/latemp-based-site"
this="$src"

remote_repo="$($__themes_dir/common/github-git-remote-repo.pl --user="Hamakor" --repo="iglu.org.il-site-sources")"

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

pristine_copy=~/Backup/Arcs/iglu-site-post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/iglu-site-post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/iglu-site-post-dest/this-incs-reduced
_post_dest="dest/"

load_common latemp
