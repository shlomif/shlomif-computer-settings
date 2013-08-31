#!/bin/bash
if [ "$(uname -m)" = "x86_64" ]; then
    FMODFOLDER="fmodapi42636linux64"
    FMODFILE="libfmodex64-4.26.36"
else
    FMODFOLDER="fmodapi42636linux"
    FMODFILE="libfmodex-4.26.36"
fi
b="$(cd .. && pwd)"
cmake -DCMAKE_INSTALL_PREFIX=$HOME/apps/zdoom -DFMOD_LIBRARY="$b/$FMODFOLDER/api/lib/$FMODFILE.so" -DFMOD_INCLUDE_DIR="$b/$FMODFOLDER/api/inc" ..
