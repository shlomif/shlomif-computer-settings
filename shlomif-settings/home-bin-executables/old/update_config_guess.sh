#!/bin/bash

remote="ftp://ftp.gnu.org/gnu/config"
cd /usr/share/libtool
for I in config.guess config.sub ; do
    wget -O"$I" "$remote/$I"
done
