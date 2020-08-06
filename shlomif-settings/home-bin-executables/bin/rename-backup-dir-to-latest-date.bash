#! /bin/bash
#
# rename-backup-dir-to-latest-date.bash
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the MIT license.
#
set -e -x
old_date="$1"
shift
new_date="`date +%Y-%m-%d`"
echo "$new_date"
if ! test -d "$new_date"
then
    cp -a "$old_date" "$new_date"
fi
(
    cd "$new_date"
    for (( i = 0; i < 20; ++i ))
    do
        (find . -name "*${old_date}*" | xargs rename "$old_date" "$new_date") || true
    done
)
