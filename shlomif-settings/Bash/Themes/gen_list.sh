#!/bin/bash

(
    (
        (find themes -type d -exec test -e {}/source.bash \; -print |
            sed 's!themes/!!' ) ;
        (cd ~/conf/Bash/private-themes && find themes -type d \
            -exec test -e {}/source.bash \; -print |
            sed 's!themes/!!' )
    ) \
    | sort
) > list-of-themes.txt

