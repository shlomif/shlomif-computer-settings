# todo.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

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
