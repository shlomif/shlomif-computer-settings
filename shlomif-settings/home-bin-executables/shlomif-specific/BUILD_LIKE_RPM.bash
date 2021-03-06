#!/usr/bin/env bash

# Copyright - who knows? taken from the Mageia rpm macros and Shlomi Fish
# disclaims all ownership of this code.

# This script builds a package with the Mageia Linux-like rpm flags.
CFLAGS='-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC'
export CFLAGS
CXXFLAGS='-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC'
export CXXFLAGS
FFLAGS='-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC'
export FFLAGS
LDFLAGS=' -Wl,--as-needed -Wl,-z,relro -Wl,-O1 -Wl,--build-id -Wl,--enable-new-dtags'
export LDFLAGS
CONFIGURE_TOP=.
/usr/lib/rpm/mageia/force-as-needed-for-shared-lib-in-libtool
/usr/lib/rpm/mageia/fix-libtool-ltmain-from-overlinking
/usr/lib/rpm/mageia/fix-libtool-from-moving-options-after-libs .
/usr/lib/rpm/mageia/fix-dlsearch-path-in-libtool-for-multilib . lib64
CONFIGURE_XPATH='--x-includes=/usr/include --x-libraries=/usr/lib64'
./configure --build=x86_64-mageia-linux-gnu --prefix="$HOME"/apps/pidgin-like-usr --exec-prefix="$HOME"/apps/pidgin-like-usr --bindir="$HOME"/apps/pidgin-like-usr/bin --sbindir="$HOME"/apps/pidgin-like-usr/sbin --sysconfdir="$HOME"/apps/pidgin-like-usr/etc --datadir="$HOME"/apps/pidgin-like-usr/share --includedir="$HOME"/apps/pidgin-like-usr/include --libdir="$HOME"/apps/pidgin-like-usr/lib64 --libexecdir="$HOME"/apps/pidgin-like-usr/libexec --localstatedir=/var --sharedstatedir="$HOME"/apps/pidgin-like-usr/com --mandir="$HOME"/apps/pidgin-like-usr/share/man --infodir="$HOME"/apps/pidgin-like-usr/share/info --x-includes="$HOME"/apps/pidgin-like-usr/include --x-libraries="$HOME"/apps/pidgin-like-usr/lib64 --enable-gnutls=yes --disable-mono --disable-nm --without-krb4 --enable-cap --with-system-ssl-certs=/etc/pki/tls/rootcerts/ --disable-static --disable-schemas-install
