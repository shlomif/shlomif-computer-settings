#! /bin/bash
#
# everytime.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#


dirs='common'
if test "$USER" = "root"
then
    dirs+=" root"
else
    dirs+=" non-root"
fi

for d in $dirs
do
    for fn in bash.d/"$d"/*.bash
    do
        if test -f "$fn"
        then
            . "$fn"
        fi
    done
done
