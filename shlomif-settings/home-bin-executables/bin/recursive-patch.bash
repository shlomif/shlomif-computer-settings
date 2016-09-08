#!/bin/bash

suffix="$1"
shift
dir="$1"
shift

find "$dir" -name "*$suffix" | (LC_ALL=C sort) |
    (while read T ; do
        diff -u20 "$T" "${T%%$suffix}"
    done)
