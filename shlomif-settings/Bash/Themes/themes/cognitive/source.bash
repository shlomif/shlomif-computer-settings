load_common mymake
load_common prompt

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

PS1="\\u[cognitive]:\$(prompt)\\$ "

cd "$this"

