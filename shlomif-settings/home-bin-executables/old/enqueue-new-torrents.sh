#!/bin/bash
for I in *.torrent ; do
    (cd ~/Download/Video/Torrents/ ;
        mv ~/"$I" . ;
        enqueue-bittorrent.pl -f "$I" ;
    ) ;
done
