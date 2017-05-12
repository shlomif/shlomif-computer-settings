#!/bin/bash

repeat_count="$1"
shift

num_cpus="$(cat /proc/cpuinfo | grep -P '^processor\s*:' | wc -l)"

loop()
{
    let i=0
    while test "$i" -lt "$repeat_count" ; do
        f
        let i++
    done
}

step=16
flags=''

f()
{
    ARGS="--worker-step $step $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/scripts/time-threads-num.bash $flags "$num_cpus" "$num_cpus"
}
loop

step=25
flags='-p'
loop
