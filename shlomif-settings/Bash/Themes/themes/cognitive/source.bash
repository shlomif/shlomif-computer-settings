load_common meta_inc1

base="$HOME/Docs/Personal/Cognitive"
this="$base"

DOC="hebrew-html-tutorial"
files="$DOC.xml.tt Summary.txt style.css"

# e()
# {
#     kate $files
# }

Sp()
{
    cd "$this"
    kate "sports/sports-log.txt"
}

prompt()
{
    __prompt_cmd \
        "\$base=$base" \
        "~=$HOME"
}

share_with_smb()
{
    cp "$1" /home/smb/read_only_share/shlomif/
}

ang()
{
    kate "$base"/Tony/for-anger.txt &
}

proj_name='cognitive'

cd "$this"
