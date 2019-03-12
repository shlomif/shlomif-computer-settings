#!/usr/bin/env bash
# This script aims to emulate the rpm-like building of valgrind, to resolve
# some bugs that were encountered in the rpm build process.
  CFLAGS="-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4" ; export CFLAGS ;
  CXXFLAGS="-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4" ; export CXXFLAGS ;
  FFLAGS="-O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4" ; export FFLAGS ;
  LDFLAGS="-Wl,--as-needed -Wl,--no-undefined -Wl,-z,relro -Wl,-O1 -Wl,--build-id -Wl,--enable-new-dtags"; export LDFLAGS ;
./configure --prefix="$HOME/apps/valgrind"
