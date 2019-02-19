load_common completion

notes="$HOME/Docs/Notes"
base="$notes/To_Do"
this="$base"
by_day="$base/by-day"

cd "$this"

__edit()
{
    (cd "$this" &&
        gvim -p To_Do.txt Done.txt Projects.txt
    )
}

e()
{
    __edit
}

alias p='hg push'
