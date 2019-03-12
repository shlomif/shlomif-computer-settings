#!/usr/bin/env bash
FMODFOLDER="fmodapi44451linux"
if [ "$(uname -m)" = "x86_64" ]; then
    FMODFILE="libfmodex64-4.44.51"
else
    FMODFILE="libfmodex-4.44.51"
fi
b="$(cd .. && pwd)"
cmake -DCMAKE_INSTALL_PREFIX=$HOME/apps/zdoom -DFMOD_LIBRARY="$b/$FMODFOLDER/api/lib/$FMODFILE.so" -DFMOD_INCLUDE_DIR="$b/$FMODFOLDER/api/inc" ..
