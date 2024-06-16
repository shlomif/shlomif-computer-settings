load_common bundle/git

if false
then
    load_common bundle/dzil_git
    load_common edit_perl_lib
fi

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

t()
{
    (
        set -e -x
        cd "$this"
        pip install --user .
    )
}

proj_name='py-primesieve'
