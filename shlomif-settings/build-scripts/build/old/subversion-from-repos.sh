#!/bin/sh

. $HOME/conf/build/subversion-base.sh

./configure --prefix=/usr/local/apps/svn-repos \
    --with-gnome-keyring \
    --enable-maintainer-mode $args $*
