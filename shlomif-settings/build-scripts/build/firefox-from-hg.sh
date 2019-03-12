#!/usr/bin/env bash
./configure --prefix="$HOME/apps/net/www/firefox-hg" \
    --enable-application=browser \
    --enable-debug --disable-optimize \
    --enable-debug-symbols \


    # --enable-extensions=default,editor/cascades
    # "Don't --enable-static" from irc.mozilla.org #developers.
    # --enable-static
    # Now the default:
    # --enable-svg \
