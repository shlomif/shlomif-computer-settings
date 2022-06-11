#! /bin/sh
#
# lynx.sh
#
# Based on the Fedora lynx .src.rpm :
# https://src.fedoraproject.org/rpms/lynx/
#
# Thanks!

# ../configure --prefix="$HOME/apps/lynx-beta" --with-gnutls # --with-nss-compat # --with-ssl
export LIBS="-lgnutls -lssl -lcrypto"
export LDFLAGS="$LIBS"
../configure --prefix="$HOME/apps/lynx-beta" \
    --disable-font-switch           \
    --disable-rpath-hack            \
    --enable-addrlist-page          \
    --enable-charset-choice         \
    --enable-cgi-links              \
    --enable-cjk                    \
    --enable-debug                  \
    --enable-default-colors         \
    --enable-externs                \
    --enable-file-upload            \
    --enable-internal-links         \
    --enable-ipv6                   \
    --enable-japanese-utf8          \
    --enable-justify-elts           \
    --enable-kbd-layout             \
    --enable-libjs                  \
    --enable-nsl-fork               \
    --enable-persistent-cookies     \
    --enable-prettysrc              \
    --enable-read-eta               \
    --enable-scrollbar              \
    --enable-source-cache           \
    --enable-warnings               \
    --with-screen=ncursesw          \
    --with-ssl=/usr/lib           \
    --with-zlib                     \
