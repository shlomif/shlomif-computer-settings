#!/bin/bash

chan_pat="$1"
shift

ls ~/Backup/old-dot-files/dot-xchat2/xchatlogs/*.log \
   ~/Backup/old-dot-files/dot-xchat2/__keep-xchatlogs/*.log \
   ~/Backup/old-dot-files/dot-xchat2/saved-xchatlogs/*.log \
   ~/.config/hexchat/logs/*.log \
   ~/Backup/laptop/2017-04-04/disk-fs/home/shlomif/.config/hexchat/logs/*/*.log \
   ~/Backup/laptop/2012-12-22/disk-fs/extra-data/unpack-for-grep/.xchat2/xchatlogs/*.log \
   | grep -iP "$chan_pat"
