#!/usr/bin/env bash
seq 1 32000 |
(
    while read DEAL ; do
        echo "$DEAL"
        text="$(make_pysol_freecell_board.py "$DEAL" forecell |
            fc-solve -g forecell -p -t -sam -l by -ni -l tfts)"
        if echo "$text" | grep -qP '^I could not solve' ; then
            echo "Unsolvable Deal - $DEAL"
        else
            echo "$text" | perl ~/verify-solitaire-solution -g "forecell" - \
                || exit
        fi
    done
)
