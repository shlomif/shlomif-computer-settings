load_common mymake

base="$HOME/Docs/lecture/Hebrew/Intro-to-HTML"
trunk="$base/trunk"
this="$trunk/hebrew-html-tutorial"

DOC="hebrew-html-tutorial"
files="$DOC.xml.tt Summary.txt style.css"

e()
{
    kate $files
}

cd "$this"


