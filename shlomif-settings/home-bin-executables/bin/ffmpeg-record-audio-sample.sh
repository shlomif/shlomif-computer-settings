#!/usr/bin/env bash
# This is an ffmpeg invocation that works on my desktop machine in order
# to record sound (and only sound - not video). It may or may not work for
# you. No strings attached.
ffmpeg -f alsa -i plughw:DEV=0,2 -acodec pcm_s16le -t 20 output.wav
