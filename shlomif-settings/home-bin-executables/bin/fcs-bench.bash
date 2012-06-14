#!/bin/bash

repeat_count="$1"
shift

for I in $(seq 1 "$repeat_count") ; do
    ARGS="--worker-step 16 -l eo" bash scripts/time-threads-num.bash 4 4
done
