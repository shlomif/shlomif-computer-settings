#! /bin/sh
#
# bitkeeper-bk--deps-mageia.sh
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

set -e -x
sudo dnf $SHLOMIF_DNF_OPTS -y install bison flex gperf lib64lz4-devel lib64pcre-devel lib64tk-devel lib64tomcrypt-devel lib64tommath-devel lib64zlib-devel
