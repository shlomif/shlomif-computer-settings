#!/bin/bash
./configure --prefix="$HOME/apps/net/www/firefox-cvs" \
    --enable-application=browser \
    --enable-svg \
    --enable-debug --disable-optimize \
    --enable-static


    # --enable-extensions=default,editor/cascades
