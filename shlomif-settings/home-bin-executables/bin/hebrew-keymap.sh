#!/bin/sh

# setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll -variant ",phonetic," 'us,ru,il'

setxkbmap \
    -option "" \
    -option "compose:ralt,grp:switch,grp:alt_shift_toggle,grp_led:scroll"  \
    -variant ",lyx" \
    'us,il'
