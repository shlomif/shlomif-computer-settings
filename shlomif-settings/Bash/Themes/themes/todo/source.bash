load_common completion
# load_common gen_patch

notes="$HOME/Docs/Notes"
base="$notes/To_Do"
this="$base"
by_day="$base/by-day"

cd "$this"

today_todo="$(date +by-day/%Y/%m-%d.txt)"

__promote()
{
    (cd "$this" &&
        {
            if ! [ -e "$today_todo" ] ; then
                orig="$(find "$by_day" -name '*.txt' | sort | tail -1)"
                mkdir -p "$(dirname $today_todo)"
                cp "$orig" "$today_todo"
            fi
        }
    )
}

__edit()
{
    (cd "$this" &&
        gvim -p To_Do.txt Done.txt Projects.txt
    )
}

e()
{
    # __promote ;
    __edit ;
}
