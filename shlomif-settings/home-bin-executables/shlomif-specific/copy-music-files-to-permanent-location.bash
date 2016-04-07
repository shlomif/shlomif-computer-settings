#!/bin/bash
ls ~shlomif/Download/Video/*.{flv,mkv,mp2,mp3,mp4,mpeg,mpg,ogg,ogm,ogv,webm} |
sort |
(
    while read fn
    do
        cp "$fn" /home/music/Music/mp3s/
    done
)
