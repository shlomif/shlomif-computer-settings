#!/bin/bash

(
    (
        (find themes -type d -exec test -e {}/source.bash \; -print |
            sed 's!themes/!!' ) ;
        (cd ../private-themes && find themes -type d \
            -exec test -e {}/source.bash \; -print |
            sed 's!themes/!!' )
    ) \
    | sort
) > list-of-themes.txt

