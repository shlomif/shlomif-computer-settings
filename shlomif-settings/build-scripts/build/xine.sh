#!/bin/bash
CFLAGS="-g" "${S:-./configure}" --prefix="$HOME/apps/xine" --enable-modplug
