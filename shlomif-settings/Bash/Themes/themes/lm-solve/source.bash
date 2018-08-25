load_common bundle/git
load_common perl_dzil

base="$HOME/progs/perl/mazes"
git_base="$base/git"
trunk="$git_base/lm-solve-source"
this="$trunk"

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
