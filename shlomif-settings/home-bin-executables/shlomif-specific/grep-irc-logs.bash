#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

chan_pat="$1"
shift

# We use for instead of ls here because ls sorts the absolute paths:
(
for fn in ~/.local/share/hexchat/logs/*.log \
   ~/.local/share/hexchat/logs/*/*.log \
   ~/Backup/old-dot-files/dot-xchat2/xchatlogs/*.log \
   ~/Backup/old-dot-files/dot-xchat2/__keep-xchatlogs/*.log \
   ~/Backup/old-dot-files/dot-xchat2/saved-xchatlogs/*.log \
   ~/Backup/laptop/2017-04-04/disk-fs"$HOME"/.config/hexchat/logs/*/*.log \
   ~/Backup/laptop/2012-12-22/disk-fs/extra-data/unpack-for-grep/.xchat2/xchatlogs/*.log \
; do
    test -e "$fn" && echo "$fn"
done) \
   | grep -iP "$chan_pat"
