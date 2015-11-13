#!/bin/bash
./configure --prefix="/opt/svn-1.6.x" --without-apache-libexecdir \
    --with-swig="/opt/svn-1.6.x/bin/swig"
# Documenting the process:
# Install swig-1.3.36:
# ./configure --prefix="/opt/svn-1.6.x"
# make
# make install
# Download and unpack subversion-1.6.17.tar.bz2
# patch -p1 < ~/subversion-1.6.0-deplibs.patch
# ./autogen.sh
# Run ./configure --prefix="/opt/svn-1.6.x" --without-apache-libexecdir
# make
# make swig-py
# make install
# make check-swig-py
# make install-swig-py
