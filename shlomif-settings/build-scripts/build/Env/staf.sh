#!/usr/bin/env bash
# One needs staf to build the main things, connprov* to be able to
# run STAFProc on the local machine and perl because I needed it.
export OS_NAME=linux BUILD_TYPE=debug PROJECTS="staf connprov* perl"
export JAVA_LIBS="/usr/java/jdk1.5.0_09/" JAVA_VERSION="1.5"
export JAVA_V12_ROOT="/usr/java/jdk1.5.0_09/" JAVA_V12_LIBDIRS="/usr/java/jdk1.5.0_09/libs/"
export PERL_BUILD_V58=1
export PERL_BUILD_V56=0
export PERL_V58_ROOT="/opt/ActivePerl-5.8"
export PATH="/opt/ActivePerl-5.8/bin:$PATH"
PLIB="$PERL_V58_ROOT/lib/"
A="$PLIB/CORE"
export PERL_V58_INCLUDEDIRS="$A" PERL_V58_LIBDIRS="$A"
# This variable is completely undocumented in the relevant part of the
# STAF documentation, but with its default value it won't work correctly.
export PERL_V58_TYPEMAP="$PLIB/ExtUtils"
