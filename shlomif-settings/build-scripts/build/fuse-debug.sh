#!/bin/sh

CFLAGS="-g" ./configure \
	--prefix=$HOME/apps/fuse/ \
    --enable-maintainer-mode
