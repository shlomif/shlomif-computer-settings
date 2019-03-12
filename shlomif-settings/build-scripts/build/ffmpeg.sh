#!/usr/bin/env bash
p="$HOME/apps/multimedia/ffmpeg"
export LD_LIBRARY_PATH="$p/lib"
./configure --prefix="$p" --enable-shared
