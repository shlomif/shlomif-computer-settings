#!/bin/bash
ffmpeg -f x11grab -y -r 12 -s 1366x768 -i :0.0 -vcodec ffv1 -qscale 0 ./out.avi
