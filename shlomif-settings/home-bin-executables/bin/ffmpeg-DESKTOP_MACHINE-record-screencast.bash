#!/bin/bash
ffmpeg -f alsa -i plughw:DEV=0,2 -acodec pcm_s16le  -f x11grab -y -r 12 -s 1920x1080 -i :0.0 -ac 1 -ar 44100 -vcodec ffv1 -qscale 0 ./out.avi
