load_common bundle/git

base="$HOME/progs/wml/Latemp"
git_base="$base"
trunk="$git_base/cookiecutter--shlomif-latemp-sites"
this="$trunk/{{cookiecutter.project_slug}}"

remote_repo="$(_shlomif_github "cookiecutter--shlomif-latemp-sites")"

prompt()
{
    __prompt_cmd "\$this=$this" "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

proj_name='cookiecutter'
alias p='git push'
cd "$this"
