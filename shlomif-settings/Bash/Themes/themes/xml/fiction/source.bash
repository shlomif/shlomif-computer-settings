load_common bundle/dzil_git
load_common ctags_using_script
load_common partests

base="$HOME/progs/perl/cpan/XML/Grammar/Fiction"
git_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/perl/modules"
fict="$modules_dir/XML-Grammar-Fiction"
this="$fict"
module="$fict"

remote_repo="$(_shlomif_github "Fiction-XML")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$fict=$fict" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

cm()
{
    cd "$module"
}

ct()
{
    cd "$trunk"
}

_dzil_install()
{
    (
    set -e -x
    dzil test --all
    dzil install
    )
}

d()
{
    _dzil_install
}

proj_name='xml-fiction'
