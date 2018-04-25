#!/bin/sh
gst_base="$HOME/apps/sound/gstreamer/from-cvs"
export PKG_CONFIG_PATH="$gst_base/lib/pkgconfig/"
prefix="$HOME/apps/sound/_gst-cvs-bmpx"
# The CFLAGS="" and CXXFLAGS="" are to cancel the -O2
CFLAGS="-g" CXXFLAGS="-g" NEON_LIBS="`pkg-config --libs neon | sed 's|-O2 ||'`" ./configure --enable-debug --prefix="$prefix" --with-dbus-services-dir="$prefix/share/dbus-1/services"
