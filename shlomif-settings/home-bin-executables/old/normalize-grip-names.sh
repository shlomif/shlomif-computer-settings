#!/bin/bash
find . -name '*.mp3' |
    (while read T; do
        cp -f "$T" "$(echo "$T" |
            perl -pe 's!^./Various - (.*) / (.*)\.mp3$!$2 - $1.mp3!;tr!/! !;')"
        ;
    done)
