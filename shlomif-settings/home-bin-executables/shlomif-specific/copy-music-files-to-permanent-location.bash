#!/bin/bash
ls ~shlomif/Download/Video/*.{mp4,flv,webm,mp3,ogg,ogv,ogm,mp2,mpeg,mpg} |
(
    while read fn
    do
        cp "$fn" /home/music/Music/mp3s/
    done
)
