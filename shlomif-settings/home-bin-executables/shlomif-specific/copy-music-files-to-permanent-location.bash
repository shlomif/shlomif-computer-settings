#!/bin/bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

ls ~shlomif/Download/Video/*.{flv,mkv,mp2,mp3,mp4,mpeg,mpg,ogg,ogm,ogv,wav,webm} |
sort |
(
    while read fn
    do
        cp "$fn" /home/music/Music/mp3s/
    done
)
