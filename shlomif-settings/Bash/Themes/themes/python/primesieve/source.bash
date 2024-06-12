load_common bundle/dzil_git
load_common edit_perl_lib

base="$HOME/progs/python/primesieve"
git_base="$base"
trunk="$base/primesieve-python"
module="$trunk"
remote_repo="$(_shlomif_github "primesieve-python")"

this="$module"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='py-primesieve'
