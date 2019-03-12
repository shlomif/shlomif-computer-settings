#!/usr/bin/env bash
ffmpeg -f alsa -i default:CARD=Intel  -f x11grab -y -r 12 -s 1366x768 -i :0.0 -ac 1 -ar 44100 -vcodec ffv1 -qscale 0 ./out.avi
