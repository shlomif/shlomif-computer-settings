load_common bundle/dzil_git

base="$HOME/progs/perl/mazes"
git_base="$base/git"
trunk="$git_base/lm-solve-source"
this="$trunk"
remote_repo="$(_shlomif_github "lm-solve-source")"

PATH="$inst_modules_dir/bin/:$PATH"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='lm-solve'
cd $this
