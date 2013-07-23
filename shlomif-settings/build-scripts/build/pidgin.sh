#!/bin/bash
pref="$HOME/apps/pidgin-beta"
# ./configure --prefix="$pref" --disable-vv --disable-meanwhile --disable-nm --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install
# ./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --enable-debug --with-gtk=2 --with-gstreamer=0.10
# ./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --enable-debug --with-gtk=2 --with-gstreamer=0.10 --enable-gnutls=yes --disable-mono --disable-nm --without-krb4 --enable-cap --with-system-ssl-certs=/etc/pki/tls/rootcerts/ --disable-static --disable-schemas-install
./configure --prefix="$pref" --with-gconf-schema-file-dir="$pref/gconf/" --disable-schemas-install --with-gtk=2 --with-gstreamer=0.10 --enable-gnutls=yes --disable-mono --disable-nm --without-krb4 --enable-cap --with-system-ssl-certs=/etc/pki/tls/rootcerts/ --disable-static --disable-schemas-install
