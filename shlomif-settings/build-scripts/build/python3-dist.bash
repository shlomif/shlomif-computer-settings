#!/bin/bash
./configure --prefix="$HOME/apps/python3" --with-threads \
                --enable-ipv6 --with-dbmliborder=gdbm \
                --with-system-expat \
                --with-system-ffi \
                --enable-shared \
                --with-valgrind \
