#!/bin/bash
# This is an arecord invocation that works on my machine.
arecord -f dat -d 20 -D hw:0,2 test.wav
