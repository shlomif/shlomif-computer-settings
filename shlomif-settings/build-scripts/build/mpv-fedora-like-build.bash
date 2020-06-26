# Adapted from rpmfusion's mpv.spec . Also see:
# https://github.com/mpv-player/mpv/issues/7859
waf configure --prefix=/opt/`whoami`/mpv \
    --disable-build-date \
    --enable-libmpv-shared \
    --enable-sdl2 \
    --enable-libarchive \
    --enable-dvdnav \
    --enable-cdda \
    --enable-html-build \
    --enable-dvbin
