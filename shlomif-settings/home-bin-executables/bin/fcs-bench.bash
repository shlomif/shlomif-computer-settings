#!/bin/bash

repeat_count="$1"
shift

export LD_LIBRARY_PATH=/home/shlomif/Download/unpack/os-zero/OS-Zero/usr/lib/c/test

num_cpus="$(cat /proc/cpuinfo | grep -P '^processor\s*:' | wc -l)"

for i in $(seq 1 "$repeat_count") ; do
    ARGS="--worker-step 16 $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/scripts/time-threads-num.bash "$num_cpus" "$num_cpus"
done
for i in $(seq 1 "$repeat_count") ; do
    ARGS="--worker-step 25 $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/scripts/time-threads-num.bash -p "$num_cpus" "$num_cpus"
done
