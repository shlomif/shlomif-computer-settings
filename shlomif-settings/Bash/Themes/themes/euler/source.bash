load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make
load_common git

rw_repos_url="$($__themes_dir/common/github-git-remote-repo.pl --user="shlomif" --repo="project-euler")"

base="$HOME/progs/riddles/project-euler/"
git_base="$base"
trunk="$base/git"
repo="$trunk"
src="$trunk/project-euler"
this="$src"

s="$src"
c="$s"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$src=$src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='ProjEuler'

