load_common bundle/git

git_base="$HOME/Docs/IGLU/linux.org.il"
base="$git_base/linux.org.il"
repo="$base"
trunk="$repo"
src="$trunk/www.linux.org.il-oldish-site/template-toolkit"
this="$src"

remote_repo="$($__themes_dir/common/github-git-remote-repo.pl --user="Hamakor" --repo="linux.org.il--old-sources")"

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

proj_name='www.linux.org.il'
