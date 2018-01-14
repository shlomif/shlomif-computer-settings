#!/bin/bash

# Copyright by Shlomi Fish, under the MIT Expat licence.

# export LD_PRELOAD=/home/shlomif/Download/unpack/prog/lockless_allocator/libllalloc.so.1.3
# export LD_PRELOAD=/home/shlomif/Download/unpack/prog/c/ltalloc/gnu.make.lib/libltalloc.so
export LD_LIBRARY_PATH=/home/shlomif/apps/tcmalloc/lib

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
    ARGS="--worker-step $step $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/../scripts/time-threads-num.bash $flags "$num_cpus" "$num_cpus"
}
loop

step=25
flags='-p'
loop
