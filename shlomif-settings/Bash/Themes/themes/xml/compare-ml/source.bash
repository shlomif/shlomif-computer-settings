load_common bundle/inc1
load_common git

base="$HOME/progs/perl/cpan/XML/CompareML"
git_base="$base"
trunk="$base/trunk"
this="$trunk"

remote_repo="$(_shlomif_github "xml-compareml")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='xml-compareml'
cd "$this"
