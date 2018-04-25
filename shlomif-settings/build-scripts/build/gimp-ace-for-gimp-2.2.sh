#!/bin/sh
export PKG_CONFIG_PATH=/usr/local/apps/gimp-1.3.x/lib/pkgconfig/
./configure
# Remove the -O2 flag from the makefile - it hinders debugging.
perl -pi -e '/^CFLAGS *=/ && s!-O2!!' src/Makefile
