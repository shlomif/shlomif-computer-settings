#!/bin/sh

PATH="$HOME/apps/arts/bin:$PATH"

CFLAGS="-g" ./configure \
	--prefix=$HOME/apps/sdl/ \
	--enable-video-opengl \
	--disable-video-svga \
	--disable-video-ggi \
	--disable-video-directfb \
    --disable-nasm \
    --disable-debug --enable-dlopen --enable-arts --enable-arts-shared \
    --enable-esd --enable-esd-shared
