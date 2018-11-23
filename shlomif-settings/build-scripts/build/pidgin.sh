#!/bin/bash
pref="$HOME/apps/pidgin-beta"
gp=/opt/gplugin/
export PKG_CONFIG_PATH="$pref/lib/pkgconfig:$pref/lib64/pkgconfig:$gp/lib64/pkgconfig"
export LD_LIBRARY_PATH="$pref/lib:$pref/lib64:$gp/lib64"
export LIBRARY_PATH="$LD_LIBRARY_PATH"
export XDG_DATA_DIRS="$gp/share:$pref/share"
# ./configure --prefix="$pref" --disable-vv --disable-meanwhile --disable-nm --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install
# ./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --enable-debug --with-gtk=2 --with-gstreamer=0.10
# ./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --enable-debug --with-gtk=2 --with-gstreamer=0.10 --enable-gnutls=yes --disable-mono --disable-nm --without-krb4 --enable-cap --with-system-ssl-certs=/etc/pki/tls/rootcerts/ --disable-static --disable-schemas-install
# ./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --with-gtk=3 --with-gstreamer=1.0 --enable-gnutls=yes --disable-mono --disable-nm --without-krb4 --enable-cap --with-system-ssl-certs=/etc/pki/tls/rootcerts/ --disable-static --disable-schemas-install --disable-vv --disable-kwallet
meson build --prefix="$pref"
