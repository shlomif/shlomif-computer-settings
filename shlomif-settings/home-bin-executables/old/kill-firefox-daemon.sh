#!/bin/bash
cmd="$1"
shift
if test "$cmd" == "start" ; then
    screen -d -m $HOME/bin/Kill-Bloated-Firefox
elif test "$cmd" == "stop" ; then
    pkill Kill-Bloated-Firefox
fi
