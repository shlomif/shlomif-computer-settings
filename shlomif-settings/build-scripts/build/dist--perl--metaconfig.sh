#!/bin/bash
pref="$HOME/apps/dist--perl--metaconfig"

echo "Freeecll Solver Enterprises" | \
    bash Configure -de -D prefix="$pref" -D installscript="$pref/bin" \
    -D scriptdir="$pref/bin" -D scriptdirexp="$pref/bin"
