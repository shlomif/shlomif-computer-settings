#!/bin/bash
# This is the build script for:
# http://cgit.freedesktop.org/~mareko/libtxc_dxtn/
#
# See:
#
# http://dri.freedesktop.org/wiki/S3TC

./configure CPPFLAGS=-m32 LDFLAGS=-m32 --prefix="$HOME/apps/libtxc_dxtn_32bit"
