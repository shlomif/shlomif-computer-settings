#!/bin/bash
./configure --prefix="/opt/svn-1.6.x"
# Documenting the process:
# Install swig-1.3.36:
#
# Download and unpack subversion-1.6.17.tar.bz2
# Run ./configure --prefix="/opt/svn-1.6.x" --without-apache-libexecdir
# make
# make swig-py
# make install
# make check-swig-py
# make install-swig-py
