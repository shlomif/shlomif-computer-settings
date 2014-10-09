#!/bin/bash
ls -d ~/Music/mp3s/* ~/Download/Video/* | perl -lane 'print if -f' > ~/t.m3u
