#!/bin/sh
./configure --prefix=$HOME/apps/net/www/thttpd
make CCOPT="-D_FILE_OFFSET_BITS=64"
