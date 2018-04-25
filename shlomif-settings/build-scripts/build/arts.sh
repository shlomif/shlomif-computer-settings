#!/bin/sh

# optflags="-O2 -fomit-frame-pointer -pipe -march=i686"
# optflags="-g"
optflags="-O2 -fomit-frame-pointer -pipe -march=i586 -mtune=pentiumpro"
bzcat ~/Rpms/SOURCES/arts-1.1.4-64bit-fixes.patch.bz2 | patch -p1
bzcat ~/Rpms/SOURCES/arts-1.3.1-fix-mem-leak.patch.bz2 | patch -p1
bzcat ~/Rpms/SOURCES/kdelibs-3.2-remove-rpath.patch.bz2 | patch -p1
bzcat ~/Rpms/SOURCES/arts-1.1.4-lib64.patch.bz2 | patch -p1
export LD_LIBRARY_PATH=/usr/lib/qt3/lib/
perl -pi -e "s@/lib(\"|\b[^/])@/lib\1@g if /(kde|qt)_(libdirs|libraries)=/" configure
CFLAGS="$optflags" CXXFLAGS="$optflags" \
        ./configure i586-mandrake-linux-gnu \
            --prefix=$HOME/apps/arts/ \
            --enable-debug=full \
                    --enable-final \
                    --enable-shared \
                    --enable-fast-install=yes \
                    --disable-embedded \
                    --disable-palmtop \
                    --disable-rpath \
                    --enable-mitshm \
                    --enable-arts-gsl \
                    --enable-cups \
                    --disable-libfam \
                    --enable-pcre \
                    --with-gnu-ld \
                    --with-pic \
                    --with-xinerama \
                    --with-alsa \
                    --with-ipv6-lookup=auto \
                    --x-includes=/usr/X11R6/include \
                    --x-libraries=/usr/X11R6/lib
