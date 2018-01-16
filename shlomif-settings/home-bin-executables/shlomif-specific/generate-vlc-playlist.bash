#!/bin/bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

ls -d ~/Music/mp3s/* ~/Download/Video/* | perl -lne 'print if -f' > ~/t.m3u
