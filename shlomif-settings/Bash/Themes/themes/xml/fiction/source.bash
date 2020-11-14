load_common bundle/dzil_git
load_common ctags_using_script

base="$HOME/progs/perl/cpan/XML/Grammar/Fiction"
git_base="$base"
trunk="$base/trunk"
modules_dir="$trunk/perl/modules"
fict="$modules_dir/XML-Grammar-Fiction"
this="$fict"
module="$fict"

remote_repo="$(_shlomif_github "fiction-xml")"

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

proj_name='xml-fiction'
