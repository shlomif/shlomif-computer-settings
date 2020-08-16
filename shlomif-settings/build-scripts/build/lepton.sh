#! /bin/sh
#
# lepton.sh
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/lepton" "$@"
