#!/bin/sh
gimp_path=/usr/local/apps/gimp-1.3.x
export PKG_CONFIG_PATH=$gimp_path/lib/pkgconfig/
export LD_LIBRARY_PATH=$gimp_path/lib
./configure --prefix=/home/shlomi/apps/multimedia/graphics/frontline --with-gimp-prefix=/usr/local/apps/gimp-1.3.x/ --disable-autotracetest
