#!/usr/bin/env bash

# Copyright by Shlomi Fish, under the MIT Expat licence.

# export LD_PRELOAD=$HOME/Download/unpack/prog/lockless_allocator/libllalloc.so.1.3
# export LD_PRELOAD=$HOME/Download/unpack/prog/c/ltalloc/gnu.make.lib/libltalloc.so
# export LD_LIBRARY_PATH=$HOME/apps/tcmalloc/lib

repeat_count="$1"
shift

num_cpus="$(cat /proc/cpuinfo | grep -P '^processor\s*:' | wc -l)"
step=16
if test -e /etc/fedora-release
then
    step=20
    # num_cpus=10
fi

loop()
{
    let i=0
    while test "$i" -lt "$repeat_count" ; do
        f
        let i++
    done
}

flags=''

f()
{
    ARGS="--worker-step $step $FCS_PGO_THEME" bash "${SRC_DIR:-.}"/../scripts/time-threads-num.bash $flags "$num_cpus" "$num_cpus"
}
loop

step=25
flags='-p'
loop
