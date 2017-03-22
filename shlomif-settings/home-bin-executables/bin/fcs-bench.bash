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

f()
{
    ARGS="--worker-step 16 $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/scripts/time-threads-num.bash "$num_cpus" "$num_cpus"
}
loop

f()
{
    ARGS="--worker-step 25 $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/scripts/time-threads-num.bash -p "$num_cpus" "$num_cpus"
}
loop
