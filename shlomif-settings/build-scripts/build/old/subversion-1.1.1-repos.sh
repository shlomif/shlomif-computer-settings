#!/bin/sh

. $HOME/conf/build/subversion-base.sh

./configure --prefix=$HOME/apps/test/svn-1.1.1 --enable-maintainer-mode $args $*
